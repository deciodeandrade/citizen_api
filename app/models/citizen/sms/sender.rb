class Citizen::Sms::Sender
  def self.send_registration_creation_notification(citizen)
    body = "#{citizen.full_name}, seu cadastro foi criado com sucesso!"
    to = citizen.phone

    ::Sms::Scheduler.new(body: body, to: to)
  end

  def self.send_registration_update_notification(citizen)
    body = "#{citizen.full_name}, seu cadastro foi atualizado com sucesso!"
    to = citizen.phone

    ::Sms::Scheduler.new(body: body, to: to)
  end
end
