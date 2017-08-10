class EventActivity < ApplicationRecord
  belongs_to :business_event, :foreign_key => 'event_id', :inverse_of => :event_activities

  def activity_type_enum
    ['Capture invoice', 'Check-in', 'Tracking']
  end
end
