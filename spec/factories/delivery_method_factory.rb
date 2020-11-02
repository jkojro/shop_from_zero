FactoryBot.define do
  factory(:delivery_method) do
    name { 'Poczta Polska' }
    price { 1 }
    duration { 3 }
  end
end
