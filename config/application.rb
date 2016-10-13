require File.expand_path('../boot', __FILE__)

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DogReview
  class Application < Rails::Application
    config.time_zone = "Hanoi"
    config.i18n.default_locale = :en
    I18n.config.enforce_available_locales = true
    config.active_record.raise_in_transactional_callbacks = true
    config.action_view.embed_authenticity_token_in_remote_forms = true

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**",
      "*.{rb,yml}")]

    config.i18n.available_locales = :en
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.middleware.use I18n::JS::Middleware
    config.action_controller.permit_all_parameters = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
