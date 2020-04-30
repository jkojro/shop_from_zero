class SessionsController < Devise::SessionsController

  def destroy
    user_session = session[:user_session]
    # cart_id = session[:cart_id]
    super
    # session[:cart_id] = cart_id
    session[:user_session]  = user_session
  end
end
