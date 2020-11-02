FactoryBot.define do
  factory(:order) do
    user
    delivery_method
    payment_method_id { 1 }
  end
end
