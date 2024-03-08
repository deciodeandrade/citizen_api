class Citizen::Sms::Sender
  def self.registration_notification(citizen)
    body = "#{citizen.full_name}, seu cadastro foi atualizado/criado com sucesso!"
    to = citizen.phone

    ::Sms::Scheduler.new(body: body, to: to)
  end
end
