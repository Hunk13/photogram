require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Photogram
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |g|
      g.factory_bot false
    end
  end
end

Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true