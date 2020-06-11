class Destination < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :prefecture_code, :city, :house_number ,presence: true
end