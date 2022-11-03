module ApplicationHelper
    # TODO: Ensure that this doesn't log staff IP's
    def ip_for_auditing
        request.remote_addr
    end

    # TODO: Convert object to class name, and use that as the event
    def event_for_auditing(event)
        event
    end

    # TODO: Target should not leak sensitive information
    def target_for_auditing(target)
        target.to_json
    end

    # INSECURE: We probably don't want to default to the first user, but otherwise things break for un-authed users.
    def actor_for_auditing
        current_user || 1
    end
end
