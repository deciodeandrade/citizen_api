class CitizenObserver < ActiveRecord::Observer
  def after_create(citizen)
    CitizenMailer.registration_notification(citizen).deliver_now
    send_sms_notification(citizen)
  end

  def after_update(citizen)
    CitizenMailer.registration_notification(citizen).deliver_now
    send_sms_notification(citizen)
  end

  private

  def send_sms_notification(citizen)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']
    
    client = Twilio::REST::Client.new(account_sid, auth_token)
    message = client.messages.create(
      body: 'Seu cadastro foi atualizado/criado com sucesso!',
      from: twilio_phone_number,
      to: citizen.phone
    )
  end
end
