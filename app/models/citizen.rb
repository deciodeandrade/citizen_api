class Citizen < ApplicationRecord
  belongs_to :address

  #has_one_attached :image

  validates :full_name, presence: true
  validates :birth_date, presence: true, comparison: { less_than: Date.current }
  validates :phone, presence: true
  validates :status, presence: true
  #validates :image, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cpf, presence: true, uniqueness: true, cpf: true
  validates :cns, presence: true, uniqueness: true, cns: true
  validates :address, presence: true

  enum status: { active: 'active',  inactive: 'inactive' }

  accepts_nested_attributes_for :address, allow_destroy: true

  scope :by_full_name, ->(full_name) { where("full_name LIKE ?", "%#{full_name}%") if full_name.present? }
  scope :by_cpf, ->(cpf) { where(cpf: cpf) if cpf.present? }
  scope :by_cns, ->(cns) { where(cns: cns) if cns.present? }
  scope :by_email, ->(email) { where("lower(email) = ?", email.downcase) if email.present? }
  scope :by_status, ->(status) { where(status: status) if status.present? }
  scope :by_zip_code, ->(zip_code) { joins(:address).where(addresses: { zip_code: zip_code }) if zip_code.present? }
end
