# spec/requests/dashboard_spec.rb
require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  include Warden::Test::Helpers  # necessário para login em request specs

  let(:user) { create(:user) }   # cria usuário com FactoryBot

  before do
    Warden.test_mode!
    login_as(user, scope: :user) # login do usuário
  end

  after do
    Warden.test_reset!
  end

  it "acessa dashboard" do
    get dashboard_path
    expect(response).to have_http_status(:ok)
  end
end
