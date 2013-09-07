require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"

Bundler.require(:default, Rails.env)

module Hackerboard
  class Application < Rails::Application
    config.time_zone = 'Brasilia'
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml').to_s]
    config.i18n.default_locale = :"pt-BR"
    config.assets.enabled = false

    console do
      require 'pry'
      require "awesome_print"
    
      config.console = Pry
      AwesomePrint.pry!
    end
  end
end