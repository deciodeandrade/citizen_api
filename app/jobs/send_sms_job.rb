class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(body:, to:)
    ::Sms::Send.new(body: body, to: to).call
  end
end
