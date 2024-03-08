class CitizenMailer < ApplicationMailer
  def send_registration_creation_notification(citizen)
    @citizen = citizen
    mail(to: @citizen.email, subject: 'Seu Cadastro de Munícipe Foi Criado')
  end

  def send_registration_update_notification(citizen)
    @citizen = citizen
    mail(to: @citizen.email, subject: 'Atualização do Seu Cadastro de Munícipe')
  end
end
