class AuditLogEntry < ApplicationRecord
    # TODO: must have target
    def self.event(opts)
        begin
            self.create(
                event: opts[:event],
                actor_id: opts[:actor_id],
                target: opts[:target],
                ip_address: opts[:ip_address]
            )

            # Share audited state in request
            Rails.cache.write('audited', true, raw: true)
        rescue => exception
            puts "Error: Exception when creating audit log entry"
            puts exception.message
        end
    end
end
