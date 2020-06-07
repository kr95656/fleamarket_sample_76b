class ShippingDestination < ApplicationRecord
  belongs_to :user, optional: true
  validates :destination_first_name, :destination_last_name, :destination_first_name_kana, :destination_last_name_kana, :post_code, :prefecture_code, :city, :address, :building, :phone_number, :user, presence: true

end
