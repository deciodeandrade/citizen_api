class SmsSenderJob < ApplicationJob
  queue_as :default

  def perform(body:, to:)
    SmsSend.new(body: body, to: to).call
  end
end
