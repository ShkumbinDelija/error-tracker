class ErrorTracker::ErrorTrackerMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      response = @app.call(env)
    rescue StandardError => e
      ErrorTracker::ErrorTrackingWorker.perform_async(env,
                                                      prepare_exception(e),
                                                      Time.now,
                                                      ErrorTracker::Defaults.user_context,
                                                      ErrorTracker::Defaults.extra_args)
      raise
    end
    response
  end

  def prepare_exception(exception)
    { message: exception.message, backtrace: exception.backtrace, klass: exception.class.to_s }
  end
end
