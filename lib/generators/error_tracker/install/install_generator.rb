# frozen_string_literal: true

module ErrorTracker
  class InstallGenerator < Rails::Generators::Base # :nodoc:
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)
    desc 'Add migrations for ErrorTracker gem'

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number(next_migration_number)
    end

    def copy_migrations
      migration_template 'create_errors.rb', 'db/migrate/create_errors.rb'
      migration_template 'create_events.rb', 'db/migrate/create_events.rb'
      migration_template 'create_event_lines.rb', 'db/migrate/create_event_lines.rb'
      migration_template 'create_error_users.rb', 'db/migrate/create_error_users.rb'
    end
  end
end
