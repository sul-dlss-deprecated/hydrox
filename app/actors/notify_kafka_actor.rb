# Sends messages to Kafka when a work is created
class NotifyKafkaActor < Hyrax::Actors::AbstractActor
  # @param [Hyrax::Actors::Environment] env
  # @return [Boolean] true if create was successful
  def create(env)
    next_actor.create(env) && publish_to_kafka('created', env)
  end

  private

  # @param action [String] what action was taken
  # @param env [Environment] the environment of the action
  def publish_to_kafka(action, env)
    kafka.deliver_message(message(action, env),
                          topic: Settings.kafka.topic)
    true
  end

  def kafka
    Kafka.new(seed_brokers: Settings.kafka.seed_brokers,
              client_id: Settings.kafka.client_id)
  end

  # @return [String] a JSON encoded message to send to Kafka
  def message(action, env)
    { action: action, work: work_message(env) }.to_json
  end

  def work_message(env)
    { id: env.curation_concern.id, title: env.curation_concern.title }
  end
end
