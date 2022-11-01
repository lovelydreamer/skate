class Admin::AuditLogController < Admin::AdminController
    def index
    end

    def show
        @event = AuditLogEntry.find(params[:id])
    end
end
