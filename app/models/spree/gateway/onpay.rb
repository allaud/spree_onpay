#encoding: utf-8
class Spree::Gateway::Onpay < Spree::Gateway
 	preference :priv_code, :string
  preference :onpay_login, :string
	preference :price_final, :boolean, :default => true
  preference :convert_currency, :boolean, :default => true
	preference :pay_type, :string, :default => 'fix'
	preference :currency, :string,:default => 'RUR'

  attr_accessible  :preferred_priv_code, :preferred_onpay_login, :preferred_price_final, :preferred_convert_currency, :preferred_pay_type, :preferred_currency

  def provider_class
    self.class
  end

  def method_type
    "onpay"
  end

  def url
    "https://secure.onpay.ru/pay/#{self.options[:onpay_login]}"
  end

  def self.current
    self.where(:type => self.to_s, :environment => Rails.env, :active => true).first
  end

end
