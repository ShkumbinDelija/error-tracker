class Error < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :error_users, dependent: :destroy
  has_many :users, through: :error_users
  scope :latest, -> { order(updated_at: :desc) }
end