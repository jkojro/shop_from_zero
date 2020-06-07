class Order < ApplicationRecord
  has_one :address
  belongs_to :deliverty_method, optional: true
  belongs_to :payment_method, optional: true
  accepts_nested_attributes_for :address
end
