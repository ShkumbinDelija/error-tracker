# frozen_string_literal: true

module ErrorTracker
  class Railtie < Rails::Railtie # :nodoc:
    initializer 'error_tracker.configure_rails_initialization' do
      Rails.application.middleware.use ErrorTracker::ErrorTrackerMiddleware
    end
  end
end
