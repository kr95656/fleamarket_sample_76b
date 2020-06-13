class ShippingDestination < ApplicationRecord
  belongs_to :user, optional: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # validates :destination_first_name, :destination_last_name, :destination_first_name_kana, :destination_last_name_kana, :post_code, :prefecture_code, :city, :address, :building, :phone_number, :user,
  validates :destination_first_name, presence: true
  validates :destination_last_name, presence: true
  validates :destination_first_name_kana, presence: true
  validates :destination_last_name_kana, presence: true
  validates :post_code, presence: true
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true
  validates :user, presence: true


end
