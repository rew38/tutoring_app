# tutor_rspec.rb

require 'spec_helper'

describe Tutor do
  # Testing relations
  # we'll run these specs later.
  # prefacing an `it` with `x` changes the tests to pending.


  it { should have_many(:appointments) }
  it { should have_many(:students).through(:appointments) }

  # validations on our model
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:hometown) }

  #Sign up tests
  it "must have a unique password" do
    tutor = Tutor.create(first_name: "josh", last_name: "zeig", email: "josh@josh.com", phone_number: "212-828-1414", hometown: "NYC", password: "abcd1234", password_confirmation: "abcd1234")
    expect( tutor ).to validate_uniqueness_of(:email)
  end

  it "test downcase_email method" do
    tutor = Tutor.new(first_name: "josh", last_name: "zeig", email: "josh@josh.com", phone_number: "212-828-1414", hometown: "NYC", password: "abcd1234", password_confirmation: "abcd1234")
    tutor.downcase_email
    expect( tutor.email ).to eq("josh@josh.com")
  end

    it "downcases an email before saving" do
    tutor = Tutor.new(first_name: "josh", last_name: "zeig", email: "josh@josh.com", phone_number: "212-828-1414", hometown: "NYC", password: "abcd1234", password_confirmation: "abcd1234")
    expect( tutor.save ).to be_true
    expect( tutor.email ).to eq("josh@josh.com")
  end

  # # tests for authentication
  # it { should have_secure_password }
  # it { should validate_confirmation_of(:password) }
  # it { should ensure_length_of(:password).is_at_least(8).is_at_most(16) }

  # # There's a bug in shoulda-matchers
  # # https://github.com/thoughtbot/shoulda-matchers/issues/371
  # it "must have a unique password" do
  #   user = User.create(name: "phil", email: "phil@phil.com", password: "abcd1234", password_confirmation: "abcd1234")
  #   expect( user ).to validate_uniqueness_of(:email)

end

