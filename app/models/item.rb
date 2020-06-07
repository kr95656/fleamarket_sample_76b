class Item < ApplicationRecord
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name,length: { in: 1..40 }
  validates :introduction,length: { in: 1..1000 }
  validates :price, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
  validates :category_id, :item_condition_id, :shipping_day_id, :shipping_prefecture_id,  :name, :introduction, :postage_payer_id, :price, presence: true
  validates :images, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :shipping_day
end
