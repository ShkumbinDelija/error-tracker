# frozen_string_literal: true

class Event < ActiveRecord::Base # :nodoc:
  belongs_to :error, counter_cache: true
  has_many :event_lines, dependent: :destroy
  store :event_hash, coder: JSON
  scope :latest, -> { order(id: :desc) }
end
