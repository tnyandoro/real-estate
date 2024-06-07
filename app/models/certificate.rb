class Certificate < ApplicationRecord
  validate :validate_utf8_encoding
  belongs_to :student
  belongs_to :course

  private

  def validate_utf8_encoding
    if !self.attributes.values.all? { |value| value.is_a?(String) ? value.valid_encoding? : true }
      errors.add(:base, "Invalid UTF-8 encoding in data")
    end
  end

end
