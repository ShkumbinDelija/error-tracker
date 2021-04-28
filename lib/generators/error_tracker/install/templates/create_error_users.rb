class CreateErrorUsers < ActiveRecord::Migration<%= "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" %>
  def change
    create_table :error_users do |t|
      t.belongs_to :error
      t.belongs_to :user
      t.timestamps
    end
  end
end
