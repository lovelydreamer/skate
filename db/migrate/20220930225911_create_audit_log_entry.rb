# frozen_string_literal: true

class CreateAuditLogEntry < ActiveRecord::Migration[6.1]
  def change
    create_table :audit_log_entries do |t|
      t.string :event
      t.integer :actor_id
      t.string :target
      t.string :ip_address
      t.timestamps
    end
  end
end
