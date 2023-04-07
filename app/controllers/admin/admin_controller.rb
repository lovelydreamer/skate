class Admin::AdminController < ApplicationController
    prepend_before_action :admin_controller_hit
    before_action :verify_admin

    private
    def verify_admin
        secure_token = request.headers["skate-admin-token"]
        raise "No admin token provided" if secure_token.nil?

        raise "Unauthorized" unless Digest::SHA2.hexdigest(secure_token) == "6a934b45144e3758911efa29ed68fb2d420fa7bd568739cdcda9251fa9609b1e"
        
        # Auth should be audited, but this should _not_ fulfill our audited request. I.e., the underlying method MUST perform the auditing
        AuditLogEntry.event(
            event: "admin_auth",
            actor_id: 1,
            target: "admin",
            ip_address: "127.0.0.1",
            satisfy_requirement: false
        )
    end
    
    def admin_controller_hit
        Rails.cache.write('admin_request_processed', true, raw: true)
    end
end
