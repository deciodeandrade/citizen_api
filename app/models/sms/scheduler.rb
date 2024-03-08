class Sms::Scheduler
  def initialize(body:, to:)
    @body = body
    @to = to
  end

  def deliver_now
    ::Sms::SendSms.new(body: body, to: to).call
  end

  def deliver_later
    SmsSendJob.perform_later(body: body, to: to)
  end

  private

  attr_accessor :body, :to
end
