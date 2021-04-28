class CreateErrors < ActiveRecord::Migration<%= "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" %>
  def change
    create_table :errors do |t|
      t.string :klass
      t.string :message
      t.boolean :ignore, default: false
      t.boolean :resolved, default: false
      t.integer :events_count, default: 0
      t.datetime :last_event_at
      t.timestamps
    end
  end
end