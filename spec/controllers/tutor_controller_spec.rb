require 'spec_helper'


describe "tutors controller" do


  it "allow a tutor to sign up " do
    visit 'tutors/new'
    within ("#new_tutor") do
      fill_in 'Name', :with => 'will'
      fill_in 'Email', :with => 'will@will.com'
      fill_in 'Phone number', :with => '917 657 2845'
      fill_in 'Hometown', :with => 'Albany'
      fill_in 'Tutors school', :with => 'NYU'
      fill_in 'Tutors course', :with => 'Biology'
      fill_in 'Password', :with => 'password2'
      fill_in 'Password confirmation', :with => 'password2'
    end
      click_button 'Create Tutor'
      expect(page).to have_content ("Login")
  end

  it "allow a tutor to login" do
    Tutor.create(:name => 'phil', :email => 'phil@phil.com', :phone_number => '2321435311', :password => 'phil', :password_confirmation => 'phil', :tutor_profile_attributes => {:hometown => 'queens', :tutors_school => 'NYU', :tutors_course => 'Ruby'})

    visit 'session/new'
    within ("form[action='/session']") do
      fill_in 'Email', :with => 'phil@phil.com'
      fill_in 'Password', :with => 'phil'
    end
    click_button 'Login'
    current_path.should == "/tutors"
    # expect(page).to have_content ("Logout")

  end



end
