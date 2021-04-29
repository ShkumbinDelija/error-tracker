# frozen_string_literal: true

module ErrorTracker
  class Defaults # :nodoc:
    attr_accessor :user_context, :extra_args

    class << self
      def user_context(options = {})
        @user ||= options
      end

      def extra_args(options = {})
        @extra_args ||= options
      end
    end
  end
end
