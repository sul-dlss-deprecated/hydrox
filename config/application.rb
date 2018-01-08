# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hydrox
  class Application < Rails::Application
    # The compile method (default in tinymce-rails 4.5.2) doesn't work when also
    # using tinymce-rails-imageupload, so revert to the :copy method
    # https://github.com/spohlenz/tinymce-rails/issues/183
    config.tinymce.install = :copy
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # The locale is set by a query parameter, so if it's not found render 404
    config.action_dispatch.rescue_responses.merge!(
      'I18n::InvalidLocale' => :not_found
    )
  end
end
