# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!

# Carrega automaticamente arquivos do spec/support (ex: factory_bot.rb, devise.rb)
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Ensures that the test database schema matches the current schema file.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Caminho para fixtures (se usar)
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  # Roda cada teste em uma transação (padrão)
  config.use_transactional_fixtures = true

  # Habilita inferência automática de tipo de spec pelo caminho
  config.infer_spec_type_from_file_location!

  # Limpa backtrace de gems Rails
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
