# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it "tem factory válida" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "não é válido sem email" do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "não é válido sem senha" do
    user = build(:user, password: nil)
    expect(user).not_to be_valid
  end

  it "permite enum roles" do
    user = build(:user, role: :admin)
    expect(user.role).to eq("admin")
    user = build(:user, role: :user)
    expect(user.role).to eq("user")
  end
end
