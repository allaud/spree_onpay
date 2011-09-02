#encoding: utf-8
class Gateway::Onpay < Gateway
 	preference :priv_code, :string
  preference :onpay_login, :string
	preference :price_final, :boolean, :default => true
  preference :convert_currency, :boolean, :default => true
	preference :pay_type, :string, :default => 'fix'
	preference :currency, :string,:default => 'RUR'

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

  def desc
      "<p>
      <b>Коммисия платежной системы (yes/no):</b>
				<ul>
				<li><b>yes:</b> Комиссию платежной системы взымать с продавца.</li>
				<li><b>no:</b> Комиссию платежной системы взымать с покупателя.</li>
				</ul>
			<b>Тип платежа(fix/free):</b>
					<ul>
					<li><b>free:</b> Пользователь сможет менять сумму платежа в платежной форме</li>
					<li><b>fix:</b> Пользователю будет показана сумма к зачислению (т.е. за вычетом всех комиссий) без возможности её редактирования.</li>
					</ul>
      <b>Тестовый режим (yes/no):</b><br>
				<ul>
				<li><b>yes</b> Расчеты ведутся в тестовой валюте (TST). Может использоватся только для тестирования платежей</li>
				<li><b>no</b> Расчеты ведутся в выбранной валюте.</li>
				</ul>
      <b>Валюта:</b><br>
				<ul>
				<li><b>RUR (по умолчанию):</b> Основная валюта ценника.</li>
				</ul>
      <b>Пароль:</b><br>
				<ul>
				<li>Секретный ключ для вычисления контрольной подписи при отправке уведомлений о поступлении платежей в вашу систему и сверки с контрольной подписью, полученной при переходе пользователей по ссылкам\\формам с вашего сайта </li>
				</ul>
      <b>Конвертировать валюту (yes/no):</b>
				<ul>
				<li><b>yes:</b> Все поступающие платежи будут конвертироваться в валюту ценника.</li>
				<li><b>no:</b> Получение той валюты, которой платит клиент.</li>
				</ul>
      <b>Логин в системе Onpay:</b><br>
				<ul>
				<li>Ваш логин в системе Onpay.</li>
				</ul>			
      </p>"
  end
end
