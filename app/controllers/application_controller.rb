class ApplicationController < ActionController::Base
    after_action :require_audit_trail

    READONLY_REQUESTS = ["GET", "HEAD"]

    private
    def require_audit_trail
        unless READONLY_REQUESTS.include?(request.request_method)
            raise "RequestNotAudited" unless audited?
        end
    end

    def audited?
        Rails.cache.read('audited', raw: true)
    end
end
