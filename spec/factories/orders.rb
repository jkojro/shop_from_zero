FactoryBot.define do
  factory(:order) do
    user
    delivery_method
    payment_method
    aasm_state { 'created' }
  end
end
