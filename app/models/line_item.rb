class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  # before_validation :set_price
  #
  # def set_price
  #   self.price = product.price
  # end
end
