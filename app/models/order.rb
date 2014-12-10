class Order < ActiveRecord::Base
  has_many :line_items
  
  after_commit :queue_processing, on: :create
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  attr_accessor :stripe_token
  attr_accessor :cart_total
  
  def queue_processing
  	OrderWorker.perform_async(id, stripe_token, cart_total)
  end
  
end
