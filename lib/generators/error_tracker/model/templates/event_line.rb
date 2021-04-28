class EventLine < ActiveRecord::Base
  belongs_to :event
  scope :latest, -> { order(id: :desc) }
end