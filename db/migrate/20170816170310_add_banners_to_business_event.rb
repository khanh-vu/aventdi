class AddBannersToBusinessEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :business_events, :banners, :string # add banners column as array
  end
end
