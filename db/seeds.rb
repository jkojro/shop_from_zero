# frozen_string_literal: true

(1..15).each do |n|
  Product.create(name: "Product #{n}",
                 description: "I really don't think there are any shortcuts built into rails to change the name of the entire project as well as the database, but luckily it really isn't that hard to make the change.",
                 price: 3.99 + n)
end
