require 'rails_helper'

RSpec.describe NotifyKafkaActor do
  describe "the middleware" do
    subject { Hyrax::CurationConcern.actor_factory.middlewares }

    it { is_expected.to include described_class }
  end
end
