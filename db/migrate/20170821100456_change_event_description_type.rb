class ChangeEventDescriptionType < ActiveRecord::Migration[5.1]
  def change
    change_column :business_events, :description, :text # add banners column as array
  end
end
