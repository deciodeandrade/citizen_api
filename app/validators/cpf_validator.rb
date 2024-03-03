class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present?
    unless CPF.valid?(value)
      record.errors.add(attribute, 'is not valid')
    end
  end
end
