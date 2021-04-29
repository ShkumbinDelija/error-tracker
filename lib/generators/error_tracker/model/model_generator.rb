# frozen_string_literal: true

module ErrorTracker
  class ModelGenerator < Rails::Generators::Base # :nodoc:
    source_root File.expand_path('templates', __dir__)

    def create_models
      template 'error.rb', File.join('app/models', 'error.rb')
      template 'error_user.rb', File.join('app/models', 'error_user.rb')
      template 'event.rb', File.join('app/models', 'event.rb')
      template 'event_line.rb', File.join('app/models', 'event_line.rb')
      template 'user.rb', File.join('app/models', 'user.rb')
    end
  end
end
