class ShippingDestination < ApplicationRecord
  belongs_to :user, optional: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture



  validates :destination_first_name, :destination_last_name, :destination_first_name_kana, :destination_last_name_kana, :post_code, :prefecture_code, :city, :address, :building, :phone_number, :user, presence: true

end
