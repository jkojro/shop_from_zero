# # frozen_string_literal: true
#
# require 'rails_helper'
#
# describe UpdateCart, type: :service do
#   describe '#call' do
#     let(:cart_product) { create(:cart_product, counter: 1) }
#     let(:params) { { cart_params: { products_attributes: { '0': { id: cart_product.product.id, products_number: products_number } } } } }
#     subject { UpdateCart.new(cart_product.cart).call(params) }
#
#     context 'number in 1..10' do
#       let(:products_number) { 6 }
#
#       it 'returns success' do
#         expect(subject.value!).to eq 'success'
#       end
#
#       it 'updates items number' do
#         expect { subject }.to change { cart_product.reload.counter }.from(1).to(6)
#       end
#     end
#
#     context 'number is 0' do
#       let(:products_number) { 0 }
#
#       it 'return success' do
#         expect(subject.value!).to eq 'success'
#       end
#
#       it 'deletes cart_product' do
#         cart_product
#         expect { subject }.to change { CartProduct.all.count }.from(1).to(0)
#       end
#     end
#
#     context 'number is negative' do
#       let(:products_number) { -1 }
#
#       it 'return success' do
#         expect(subject.value!).to eq 'success'
#       end
#
#       it 'deletes cart_product' do
#         cart_product
#         expect { subject }.to change { CartProduct.all.count }.from(1).to(0)
#       end
#     end
#
#     context 'number is over 10' do
#       let(:products_number) { 11 }
#
#       it 'return :too_many_products' do
#         expect(subject.failure).to eq :too_many_items
#       end
#
#       it 'does not change items number' do
#         expect { subject }.not_to change { cart_product.reload.counter }
#       end
#     end
#   end
# end
