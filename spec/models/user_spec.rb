require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create!(
    name: "John",
    email: "john@email.com",
    password: "foobar"
  )
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_length_of(:password).is_at_least(6)}

  it "creates a password digest when given a password" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "sets a new session token" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end
    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe ".find_by_credentials" do
    before {user.save!}
    it "returns user given good credentials" do
      expect(User.find_by_credentials("john@email.com", "foobar")).to eq(user)
    end
    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("john@email.com", "password")).to eq(nil)
    end
  end
end
