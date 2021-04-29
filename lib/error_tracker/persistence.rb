# frozen_string_literal: true

module ErrorTracker
  class Persistence # :nodoc:
    class << self
      def persist_error(exception, occurred_at)
        klass = exception.is_a?(OpenStruct) ? exception.klass : exception.class.to_s
        error = Error.find_or_create_by(klass: klass, message: exception.message)
        return error if error.ignore?

        error.update(updated_at: occurred_at, resolved: false)
        error
      end

      def persist_event_lines(event, line)
        max_lines = `wc -l < #{line[0]}`.to_i
        max_lines = if line[1].to_i > max_lines
                      0
                    else
                      line[1].to_i + 5 > max_lines ? max_lines - line[1].to_i : 5
                    end
        range = ((line[1].to_i - 5).negative? ? 0 : line[1].to_i - 5)...(line[1].to_i + max_lines)
        file = File.open(line[0])
        lines = [*file][range]
        lines.each do |code|
          event.event_lines.create(code: code)
        end
        event.update(first_line: range.first)
      end

      def persist_event(error, event_hash, occurred_at, line)
        event = Event.new(event_hash: event_hash, occurred_at: occurred_at,
                          path: line[0], line: line[1], klass_method: line[2])
        error.events << event
        event
      end

      def persist_error_relations(exception, event_hash, occurred_at)
        line = ErrorTracker::Utils.fetch_line_from_backtrace(exception.backtrace)
        error = persist_error(exception, occurred_at)
        return if error.ignore?

        event = persist_event(error, event_hash, occurred_at, line)
        persist_event_lines(event, line)
      end
    end
  end
end
