# student_rspec.rb
require 'spec_helper'

describe Student do
  # Testing relations
  # we'll run these specs later.
  # prefacing an `it` with `x` changes the tests to pending.

  it { should have_many(:appointments) }
  it { should have_many(:tutors).through(:appointments) }

  # validations on our model
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:students_school) }
  it { should validate_presence_of(:class_of) }

  #Sign up tests
  it "must have a unique password" do
    student = Student.create(first_name: "raph", last_name: "werth", email: "raph@raph.com", phone_number: "212-767-9318", students_school: "GWU", class_of: 2014, password: "abcd1234", password_confirmation: "abcd1234")
    expect( student ).to validate_uniqueness_of(:email)
  end

  it "test downcase_email method" do
    student = Student.new(first_name: "raph", last_name: "werth", email: "RAPH@raph.com", phone_number: "212-767-9318", students_school: "GWU", class_of: 2014, password: "abcd1234", password_confirmation: "abcd1234")
    student.downcase_email
    expect( student.email ).to eq("raph@raph.com")
  end

  it "downcases an email before saving" do
    student = Student.new(first_name: "raph", last_name: "werth", email: "RAPH@raph.com", phone_number: "212-767-9318", students_school: "GWU", class_of: 2014, password: "abcd1234", password_confirmation: "abcd1234")
    expect( student.save ).to be_true
    expect( student.email ).to eq("raph@raph.com")
  end

  it "tests that student emails look like an actual email" do
    student = Student.new(first_name: "raph", last_name: "werth", email: "raph", phone_number: "212-767-9318", students_school: "GWU", class_of: 2014, password: "abcd1234", password_confirmation: "abcd1234")
    expect(student).to_not be_valid
  end

  it "a student can successfully sign up, an object will be added to data base" do
    student = Student.new(first_name: "raph", last_name: "werth", email: "raph@raph.com", phone_number: "212-767-9318", students_school: "GWU", class_of: 2014, password: "abcd1234", password_confirmation: "abcd1234")
    expect(student).to be_valid
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
