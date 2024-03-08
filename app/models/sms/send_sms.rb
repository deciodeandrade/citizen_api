class Sms::SendSms
  def initialize(body:, to:)
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @from = TWILIO_PHONE_NUMBER
    @body = body
    @to = to
  end

  def call
    client.messages.create(
      body: body,
      from: from,
      to: to
    )
  end

  private

  attr_accessor :client, :body, :from, :to

  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  TWILIO_PHONE_NUMBER = ENV['TWILIO_PHONE_NUMBER']
end
