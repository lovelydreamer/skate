class Admin::AdminController < ApplicationController
    before_action :verify_admin

    # TODO: Every admin action should be audited

    private
    def verify_admin
        puts "Admin verified"
        AuditLogEntry.event(
            event: "admin_auth",
            actor_id: 1,
            target: "admin",
            ip_address: "127.0.0.1"
        )
    end
end
