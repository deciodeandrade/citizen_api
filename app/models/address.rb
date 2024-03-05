class Address < ApplicationRecord
  has_many :citizens

  validates :zip_code, presence: true
  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
