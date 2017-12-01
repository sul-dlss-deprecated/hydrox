# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Hyrax::CurationConcern.actor_factory.use NotifyKafkaActor
