class Checkout

  attr_reader :step
  attr_reader :order

  STEPS = [Address, DeliveryMethod, PaymentMethod, Summary].freeze

  def initialize(order: nil, user_id:, step:)
    @step = get_step(step)
    @order = order
    @user_id = user_id
  end

  def get_step(step)
    return @step if @step
    return Kernel.const_get(step) if step
    STEPS.first
  end

  def update_order(params)
    @order = @step.update_order(order: order, user_id: user_id, params: params)
  end

  def next_step
    @step = STEPS[STEPS.index(@step) + 1]
  end

  private



  attr_writer :order
  attr_reader :user_id
  # attr_writer :step
end
