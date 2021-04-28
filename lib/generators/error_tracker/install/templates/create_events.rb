class CreateEvents < ActiveRecord::Migration<%= "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" %>
  def change
    create_table :events do |t|
      t.text :event_hash
      t.datetime :occurred_at
      t.string :path
      t.integer :line
      t.integer :first_line
      t.string :klass_method
      t.belongs_to :error
      t.timestamps
    end
  end
end
