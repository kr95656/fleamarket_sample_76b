class Item < ApplicationRecord
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :images, allow_destroy: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :shipping_day
end
