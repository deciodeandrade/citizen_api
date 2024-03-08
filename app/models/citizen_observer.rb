class CitizenObserver < ActiveRecord::Observer
  def after_create(citizen)
    CitizenMailer.registration_notification(citizen).deliver_later
    SmsSender.registration_notification(citizen).deliver_later
  end

  def after_update(citizen)
    CitizenMailer.registration_notification(citizen).deliver_later
    SmsSender.registration_notification(citizen).deliver_later
  end
end
