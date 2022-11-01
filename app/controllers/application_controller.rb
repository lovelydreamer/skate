# TODO: Modify notes task to prohibit node_modules
# TODO: Bundle JS assets so things work offline
# TODO: Build script to export data parameters to MD table
# TODO: Build report endpoint, which dynamically selects a table to provide analytics of.
# TODO: Emit Request ID
# TODO: Hook to connect as read-only to database if there's no state-changing request
class ApplicationController < ActionController::Base
    # TODO: This should be re-named, since we're technically not _requiring_ anything
    after_action :require_audit_trail

    private
    def require_audit_trail
        unless ["GET","HEAD"].include?(request.request_method)
            raise "RequestNotAudited" unless audited?
        end
    end

    # TODO: Maybe this should be tied to request_id instead?
    def audited?
        Rails.cache.read('audited', raw: true)
    end
end
