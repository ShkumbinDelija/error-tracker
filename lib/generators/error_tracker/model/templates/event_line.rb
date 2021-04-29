# frozen_string_literal: true

class EventLine < ActiveRecord::Base # :nodoc:
  belongs_to :event
  scope :latest, -> { order(id: :desc) }
end
