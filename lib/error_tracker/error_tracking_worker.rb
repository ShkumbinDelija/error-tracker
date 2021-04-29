# frozen_string_literal: true

require 'sidekiq'

module ErrorTracker
  class ErrorTrackingWorker # :nodoc:
    include Sidekiq::Worker
    sidekiq_options queue: :default, retry: true

    def perform(env, exception, occurred_at, user_context, extra_args)
      ErrorTracker::AutomaticTracker.capture(env,
                                             OpenStruct.new(exception),
                                             occurred_at,
                                             user_context,
                                             extra_args)
    end
  end
end
