class BusinessEventAddress < ApplicationRecord
  belongs_to :business_event, :foreign_key => 'event_id'
  belongs_to :business_address, :foreign_key => 'address_id'

  rails_admin do
    visible false
  end
end
