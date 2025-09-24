# spec/support/devise.rb
RSpec.configure do |config|
  # para request specs (sign_in, sign_out)
  config.include Devise::Test::IntegrationHelpers, type: :request

  # para controller specs
  config.include Devise::Test::ControllerHelpers, type: :controller
end
