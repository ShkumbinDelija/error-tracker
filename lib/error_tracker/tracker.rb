# frozen_string_literal: true

module ErrorTracker
  class Tracker # :nodoc:
    class << self
      def capture(exception = nil, options = {}, &block)
        return if exception.blank? && !block_given?

        occurred_at = Time.now
        if block_given?
          manage_block(occurred_at, &block)
        else
          manage_exception(exception, options, occurred_at)
        end
      end

      def manage_block(occurred_at)
        yield
      rescue StandardError => e
        manage_exception(e, {}, occurred_at)
      end

      def manage_exception(exception, options, occurred_at)
        event_hash = { user_args: options, extra_args: ErrorTracker::Defaults.extra_args,
                       user: ErrorTracker::Defaults.user_context }
        ErrorTracker::Persistence.persist_error_relations(exception, event_hash, occurred_at)
      end
    end
  end
end
