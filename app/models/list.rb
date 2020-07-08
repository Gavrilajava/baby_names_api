class List < ApplicationRecord

  has_many :names

  validate :validate_records_number, on: :create
  validates :alphanumeric, uniqueness: true

  def validate_records_number
    self.errors.add(:base, "Maximum number of lists exceeded") if List.count > 12**62
  end

  def initialize(params=nil)
    # If it were a real application, I'd suggest using uuid as an id.
    alphanumeric = ""
    loop do
      alphanumeric = SecureRandom.alphanumeric(12)
      break if !List.find_by(alphanumeric: alphanumeric)
    end
    params_with_an = {alphanumeric: alphanumeric}.merge(params.to_h)
    super(params_with_an)
  end
end
