class CnsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present?
    unless GemCNS.isValid(value)
      record.errors.add(attribute, 'is not valid')
    end
  end
end
