class SmsSender
  def initialize(body:, to:)
    @body = body
    @to = to
  end

  def deliver_now
    SmsSend.new(body: body, to: to).call
  end

  def deliver_later
    SmsSenderJob.perform_later(body: body, to: to)
  end

  private

  attr_accessor :body, :to
end
