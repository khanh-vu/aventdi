class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :password, :password_confirmation, presence: true, :on => :create
  rails_admin do
    edit do
      include_fields :email, :name, :password, :password_confirmation
      field :email do
        help "Required. Can't be changed after creation."
        read_only do
          bindings[:object].id.present?
        end
      end
    end
    show do
      include_fields :email, :name
      include_all_fields
    end
    list do
      include_fields :email, :name, :sign_in_count, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at
    end
  end
end
