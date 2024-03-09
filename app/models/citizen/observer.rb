class Citizen::Observer < ActiveRecord::Observer
  observe :citizen

  def after_create(citizen)
    CitizenMailer.send_registration_creation_notification(citizen).deliver_later
    ::Citizen::Sms::Sender.send_registration_creation_notification(citizen).deliver_later
  end

  def after_update(citizen)
    CitizenMailer.send_registration_update_notification(citizen).deliver_later
    ::Citizen::Sms::Sender.send_registration_update_notification(citizen).deliver_later
  end
end
