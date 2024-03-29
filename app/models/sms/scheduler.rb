class Sms::Scheduler
  def initialize(body:, to:)
    @body = body
    @to = to
  end

  def deliver_now
    ::Sms::Send.new(body: body, to: to).call
  end

  def deliver_later
    SendSmsJob.perform_later(body: body, to: to)
  end

  private

  attr_accessor :body, :to
end
