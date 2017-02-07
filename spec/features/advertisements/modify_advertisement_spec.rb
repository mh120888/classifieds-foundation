feature 'Modify advertisement', :devise, :js do
  # Scenario: Signed in user can see edit/delete options for his/her own advertisement
  #   Given I exist as a user
  #   And I am signed in
  #   And I created an advertisement
  #   When I go to the home page
  #   Then I see options to edit and delete the ad
  scenario 'user can see edit/delete options for own advertisement' do
    advertisement = FactoryGirl.create(:advertisement)
    user = advertisement.user

    signin(user.email, user.password)

    expect(page).to have_content 'Edit'
    expect(page).to have_content 'Delete'
  end

  # Scenario: Visitor cannot see edit/delete options for his/her own advertisement
  #   Given I am not signed in
  #   And there is one advertisement
  #   When I go to the home page
  #   Then I do not see options to edit and delete the ad
  scenario 'visitor cannot see edit/delete options for own advertisement' do
    advertisement = FactoryGirl.create(:advertisement)

    visit root_path

    expect(page).not_to have_content 'Edit'
    expect(page).not_to have_content 'Delete'
  end

  # Scenario: Signed in user can edit an advertisement
  #   Given I am not signed in as a user
  #   If I try to edit an ad
  #   Then I am redirected to sign in
  scenario 'signed in user can edit an advertisement' do
    advertisement = FactoryGirl.create(:advertisement)
    user = advertisement.user

    signin(user.email, user.password)

    click_on 'Edit'
    fill_in 'Title', with: 'New Couch'
    click_on 'Update Advertisement'

    expect(page).to have_content 'Advertisement was successfully updated.'
  end

  # Scenario: Visitor user cannot edit an advertisement
  #   Given I am not signed in as a user
  #   If I try to edit an ad
  #   Then I am redirected to sign in
  scenario 'visitor cannot access edit advertisement page' do
    advertisement = FactoryGirl.create(:advertisement)

    visit "advertisements/#{advertisement.id}/edit"

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  # Scenario: Signed in user can delete an advertisement
  #   Given I am signed in as a user
  #   If I try to delete an ad
  #   Then I see a success message
  #   And the deleted ad is not listed on the home page
  scenario 'signed in user can delete an advertisement' do
    advertisement = FactoryGirl.create(:advertisement)
    user = advertisement.user

    signin(user.email, user.password)

    accept_alert do
      click_on 'Delete'
    end

    expect(page).to have_content 'Advertisement was successfully destroyed.'
  end

end