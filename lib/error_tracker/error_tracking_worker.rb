require 'sidekiq'

class ErrorTracker::ErrorTrackingWorker
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
