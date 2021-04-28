class CreateEventLines < ActiveRecord::Migration<%= "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" %>
  def change
    create_table :event_lines do |t|
      t.string :code
      t.belongs_to :event
      t.timestamps
    end
  end
end
