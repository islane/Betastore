class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items

  validates :price, numericality: { greater_than_or_equal_to: 0, message: 'must be a number' }
  #validate :price_is_num
  validate :must_have_name

  def must_have_name
    errors.add(:name, 'is required') unless name.present?
  end

  # def price_is_num
  #   errors.add(:price, 'must be a number') unless price.present? && price.is_a?(BigDecimal)
  # end

  def send_confirmation_email
    #TODO: Actually send this email
    logger.warn "Sending email to #{email}"
  end

end
