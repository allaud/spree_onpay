#encoding: utf-8
Spree::CheckoutController.class_eval do
  before_filter :redirect_to_onpay, :only => :update

  private

  #Redirect to Onpay
  def redirect_to_onpay
    return unless params[:state] == "payment"
    payment_method = Spree::PaymentMethod.find(params[:order][:payments_attributes].first[:payment_method_id])
    if payment_method.kind_of? Spree::Gateway::Onpay
      redirect_to gateway_onpay_path(:gateway_id => payment_method.id, :order_id => @order.id)
    end

  end

end
