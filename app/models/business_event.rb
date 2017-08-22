class BusinessEvent < ApplicationRecord
  belongs_to :business_listing
  belongs_to :business_event_category, :inverse_of => :business_events

  has_many :business_event_addresses
  has_many :business_addresses, :through => :business_event_addresses, :foreign_key => 'event_id'

  has_many :event_activities, :foreign_key => 'event_id', :inverse_of => :business_event
  accepts_nested_attributes_for :event_activities, :allow_destroy => true

  # delegate :activity_type, :to => :event_activities, :allow_nil => true

  attr_accessor :activity_types
  attr_reader :marker

  validates :business_listing, :presence => true
  validates :business_event_category, :presence => true
  validates :name, :presence => true

  mount_uploader :image, ImageUploader
  mount_uploaders :banners, BannerUploader
  serialize :banners, JSON # If you use SQLite, add this line.

  rails_admin do
    create do
      include_fields :name, :description, :image, :banners, :business_event_category,
            :business_listing, :is_featured, :event_activities,  :start_time, :end_time
      field :banners do
        partial "business_event/banners"
      end
      field :is_featured do
        partial "business_event/featured"
      end
      exclude_fields :business_event_addresses, :business_addresses

    end
    edit do
      include_fields :name, :description, :image, :banners, :business_event_category,
                     :business_listing, :is_featured, :business_addresses, :event_activities, :start_time, :end_time
      field :banners do
        partial "business_event/banners"
      end
      field :is_featured do
        partial "business_event/featured"
      end
      exclude_fields :business_event_addresses
      field :business_addresses do
        associated_collection_cache_all true  # REQUIRED if you want to SORT the list as below
        associated_collection_scope do
          # bindings[:object] & bindings[:controller] are available, but not in scope's block!
          event = bindings[:object]
          Proc.new { |scope|
            # scoping all Players currently, let's limit them to the team's league
            # Be sure to limit if there are a lot of Players and order them by position
            scope = scope.where(business_listing_id: event.business_listing_id) if event.present?
            scope = scope.limit(30) # 'order' does not work here
          }
        end
      end
    end
    show do
      include_fields :name, :description, :image, :business_event_category,
                     :business_listing, :is_featured, :business_addresses, :event_activities, :start_time, :end_time
      # field :banners do
      #   pretty_value do
      #     bindings[:view].render(
      #         partial: "business_event/show_banners", locals:  {field: self, form: bindings[:form], object: bindings[:object]}
      #     )
      #   end
      # end
      exclude_fields :business_event_addresses
    end
    list do
      include_fields :name, :description, :image, :business_event_category,
                     :business_listing, :is_featured, :business_addresses, :event_activities, :start_time, :end_time

      exclude_fields :business_event_addresses, :created_at, :updated_at
    end
  end

  # serialize :activity_types, Array
  # def activity_types_enum
  #   ['Capture invoice', 'Check-in', 'Tracking']
  # end

  def category
    business_event_category
  end

  def activity_types
    self.event_activities.pluck(:activity_type)
  end

  def marker
    self.business_event_category.marker.medium
  end
end