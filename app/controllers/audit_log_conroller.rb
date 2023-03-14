# frozen_string_literal: true

# TODO: Build this. Allow users to export logs as JSON, CSV or HTML
class AuditLogController < ApplicationController
  before_action :fetch_events_for_user

  def index; end

  def show
    @events_for_user.where(id: params[:id])
  end

  private

  # TODO: Introduce a misconfigured invocation, which misconfigures the user id
  def fetch_events_for_user
    @events_for_user = AuditLogEntry.where(actor_id: current_user.id)
  end
end
