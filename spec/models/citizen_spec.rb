require 'rails_helper'

RSpec.describe Citizen, type: :model do
  it { is_expected.to validate_presence_of(:full_name) }

  it { is_expected.to validate_presence_of(:cpf) }
  it { is_expected.to validate_uniqueness_of(:cpf) }
  it { is_expected.to allow_value('55846726372').for(:cpf) }
  it { is_expected.not_to allow_value('invalid_cpf').for(:cpf) }

  it { is_expected.to validate_presence_of(:cns) }
  it { is_expected.to validate_uniqueness_of(:cns) }
  it { is_expected.to allow_value('225011671660003').for(:cns) }
  it { is_expected.not_to allow_value('invalid_cns').for(:cns) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to allow_value('user@example.com').for(:email) }
  it { is_expected.not_to allow_value('invalid_email').for(:email) }

  it { is_expected.to validate_presence_of(:birth_date) }
  it "is valid with past birth_date" do
    subject.birth_date = 1.day.ago
    subject.valid?
    expect(subject.errors).to_not include :birth_date
  end

  it "is invalid with current birth_date" do
    subject.birth_date = Time.zone.now
    subject.valid?
    expect(subject.errors).to include :birth_date
  end

  it "is invalid with future birth_date" do
    subject.birth_date = Time.zone.now + 1.hour
    subject.valid?
    expect(subject.errors).to include :birth_date
  end

  it { is_expected.to validate_presence_of(:phone) }

  it { is_expected.to validate_presence_of(:status) }
  it do
    is_expected.to define_enum_for(:status)
      .with_values({ active: 'active', inactive: 'inactive' })
      .backed_by_column_of_type(:string)
  end

  it { is_expected.to validate_presence_of(:image) }
end
