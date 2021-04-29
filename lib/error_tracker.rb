# frozen_string_literal: true

require_relative "error_tracker/version"

module ErrorTracker # :nodoc:
  class Error < StandardError; end
end

require 'rails'
require 'rails/generators'
require 'error_tracker/models/error'
require 'error_tracker/models/event'
require 'error_tracker/models/event_line'
require 'error_tracker/models/error_user'
require 'error_tracker/defaults'
require 'error_tracker/utils'
require 'error_tracker/persistence'
require 'error_tracker/automatic_tracker'
require 'error_tracker/error_tracking_worker'
require 'error_tracker/error_tracker_middleware'
require 'error_tracker/railtie'
require 'error_tracker/tracker'
require 'generators/error_tracker/install/install_generator'
require 'generators/error_tracker/model/model_generator'
