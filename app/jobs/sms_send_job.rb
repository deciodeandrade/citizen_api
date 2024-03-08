class SmsSendJob < ApplicationJob
  queue_as :default

  def perform(body:, to:)
    ::Sms::SendSms.new(body: body, to: to).call
  end
end
