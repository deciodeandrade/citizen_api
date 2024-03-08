class Citizen::Observer < ActiveRecord::Observer
  observe :citizen

  def after_create(citizen)
    CitizenMailer.registration_notification(citizen).deliver_later
    ::Citizen::Sms::Sender.registration_notification(citizen).deliver_later
  end

  def after_update(citizen)
    CitizenMailer.registration_notification(citizen).deliver_later
    ::Citizen::Sms::Sender.registration_notification(citizen).deliver_later
  end
end
