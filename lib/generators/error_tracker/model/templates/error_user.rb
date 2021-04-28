class ErrorUser < ActiveRecord::Base
  belongs_to :error
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :error_id, message: 'User has already been assigned to this error.'
end
