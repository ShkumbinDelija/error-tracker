class ErrorTracker::Railtie < Rails::Railtie
  initializer 'error_tracker.configure_rails_initialization' do
    Rails.application.middleware.use ErrorTracker::ErrorTrackerMiddleware
  end
end