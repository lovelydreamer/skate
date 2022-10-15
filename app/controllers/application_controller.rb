class ApplicationController < ActionController::Base
    # TODO: implement hook to ensure that state-changing requests are audited
    after_action :require_audit_trail

    private
    def require_audit_trail
        # For non-get requests, ensure that requests are audited
        
    end
end
