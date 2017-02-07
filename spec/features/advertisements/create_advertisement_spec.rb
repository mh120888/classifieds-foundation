feature 'Create advertisement', :devise do
  # Scenario: Signed in user can create an advertisement
  #   Given I exist as a user
  #   And I am signed in
  #   When I try to create an advertisement
  #   Then I see a success message
  scenario 'signed in user can create advertisement' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    click_on 'New Advertisement'
    fill_in 'Title', with: 'Old Couch'
    fill_in 'Description', with: 'Five year old brown couch available.'
    fill_in 'Price', with: '$20 OBO'
    click_on 'Create Advertisement'

    expect(page).to have_content 'Advertisement was successfully created.'
  end

  # Scenario: Non-signed in user cannot create an advertisement
  #   Given I am not signed in as a user
  #   When I visit the home page
  #   Then I cannot create an advertisement from the home page
  scenario 'visitor does not see button to create new advertisement' do
    visit root_path

    expect(page).not_to have_content 'New Advertisement'
  end

  # Scenario: Non-signed in user cannot create an advertisement
  #   Given I am not signed in as a user
  #   When I visit the new advertisement page
  #   Then I am redirected to sign in
  scenario 'visitor cannot access new advertisement page' do
    visit 'advertisements/new'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end