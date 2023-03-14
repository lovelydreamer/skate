# frozen_string_literal: true

module Admin
  class AuditLogController < Admin::AdminController
    def index; end

    def show
      @event = AuditLogEntry.find(params[:id])
    end
  end
end
