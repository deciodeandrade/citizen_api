class CitizenMailer < ApplicationMailer
  def registration_notification(citizen)
    @citizen = citizen
    mail(to: @citizen.email, subject: 'Cadastro de Munícipe')
  end
end
