class Citizen < ApplicationRecord
  belongs_to :address

  has_one_attached :image

  validates :full_name, presence: true
  validates :birth_date, presence: true, comparison: { less_than: Date.current }
  validates :phone, presence: true
  validates :status, presence: true
  validates :image, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cpf, presence: true, uniqueness: true, cpf: true
  validates :cns, presence: true, uniqueness: true, cns: true
  validates :address, presence: true

  enum status: { active: 'active',  inactive: 'inactive' }
end
