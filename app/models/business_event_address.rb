class BusinessEventAddress < ApplicationRecord
  belongs_to :business_event
  belongs_to :business_address

  rails_admin do
    visible false
  end
end
