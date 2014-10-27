class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items

  validates :price, numericality: { greater_than_or_equal_to: 0, message: 'must be a number' }
  #validate :price_is_num
  validate :must_have_name
  validate :must_have_price
  validate :must_have_image_url

  def must_have_name
    errors.add(:name, 'is required') unless name.present?
  end

  def must_have_price
    errors.add(:price, 'is required') unless price.present?
  end

  def must_have_image_url
    errors.add(:image_url, 'is required') unless image_url.present?
  end

  # def price_is_num
  #   errors.add(:price, 'must be a number') unless price.present? && price.is_a?(BigDecimal)
  # end

  def send_confirmation_email
    #TODO: Actually send this email
    logger.warn "Sending email to #{email}"
  end

end
