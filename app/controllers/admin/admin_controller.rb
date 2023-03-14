# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    before_action :verify_admin

    # TODO: Every admin action should be audited

    private

    def verify_admin
      # TODO: We need to do actual RBAC
      # TODO: Maybe we should log the entire HTTP request path?
      puts 'Admin verified'

      # TODO: Auth should be audited, but this should _not_ fulfill our audited request. I.e., the underlying method MUST perform the auditing
      AuditLogEntry.event(
        event: 'admin_auth',
        actor_id: 1,
        target: 'admin',
        ip_address: '127.0.0.1',
        satisfy_requirement: false
      )
    end
  end
end
