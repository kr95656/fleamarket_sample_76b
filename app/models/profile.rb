class Profile < ApplicationRecord
  belongs_to :user, optional: true
  # validates :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day, :user, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  # validates :birth_year, presence: true
  # validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :user, presence: true
end
