class UpdateCartProductCounter
  include Dry::Monads[:result]

  def initialize(cart_product)
    @cart_product = cart_product
  end

  def call(params)
    counter = @cart_product.counter + params[:number_to_add].to_i
    if @cart_product.update(counter: counter)
      Success('Ilość sztuk została zaktualizowana')
    else
      Failure('Coś poszlo nie tak. Spróbuj ponownie')
    end
  end
end
