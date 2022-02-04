require 'rails_helper'

RSpec.feature 'Food #New', type: :feature do
  background do
    visit new_user_session_path
    @first_user = User.create(name: 'Mark', email: 'mark@gmail.com', password: '0123456', confirmed_at: Time.now)

    fill_in 'user_email', with: @first_user.email
    fill_in 'user_password', with: @first_user.password
    click_button 'Log in'
    visit foods_path
    click_link 'Add Food'
  end

  it 'has food name text box' do
    expect(page.body).to include('placeholder="Food Name"')
  end

  it 'has food price number field' do
    expect(page.body).to include('placeholder="Unit Price"')
  end

  it 'sees add save button' do
    expect(page.has_button?('Save')).to be true
  end

  it 'redirects correctly to the add new food link' do
    fill_in 'food_name', with: 'corn'
    fill_in 'food_price', with: 5
    click_button 'Save'
    expect(page).to have_current_path(foods_path)
  end
end
