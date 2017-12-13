class Query < ApplicationRecord
  validates :owner, presence: true
  validates :repo, presence: true
  validate :allowed_event_type

  def allowed_event_type
    return true if event_type.blank?
    errors.add(:event_type, "not allowed") unless Github::Event.valid?(event_type)
  end

end
