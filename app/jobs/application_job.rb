# frozen_string_literal: true

# :default_queue matches a preexisting SQS queue in AWS
# per https://github.com/tawan/active-elastic-job#usage
class ApplicationJob < ActiveJob::Base
  queue_as :default_queue
end
