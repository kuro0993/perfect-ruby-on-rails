class AsyncLogJob < ApplicationJob
  # queue_as :default
  queue_as :async_log

  def perform(message: 'hello')
    # Do something later
    AsyncLog.create!(message: message)
  end
end
