class Order < ApplicationRecord
  include AASM

  has_one :address
  belongs_to :user
  belongs_to :deliverty_method, optional: true
  belongs_to :payment_method, optional: true
  accepts_nested_attributes_for :address

  aasm do
    state :created, initial: true
    state :addressed, :delivery_set, :payment_set, :paid

    event :set_address do
      transitions from: :created, to: :addressed
    end

    event :set_delivery do
      transitions from: :addressed, to: :delivery_set
    end

    event :set_payment do
      transitions from: [:delivery_set, :addressed], to: :payment_set
    end

    event :pay do
      transitions from: [:delivery_set, :addressed, :payment_set], to: :paid
    end
  end

end
