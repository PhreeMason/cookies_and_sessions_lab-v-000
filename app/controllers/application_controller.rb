class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_cart
 
  def current_cart
    session[:cart] ||= []
  end
  
  def cart
    current_cart
  end
  
  def index
  end
  
  def shop
    cart << cart_params
    session[:cart] = cart
    @cart = session[:cart]
    render :'products/index'
  end
  
  private 
    def cart_params
      params.require(:product)
    end
    
  
end

