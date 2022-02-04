require 'rails_helper'

RSpec.feature 'Recipe #New', type: :feature do
  background do
    visit new_user_session_path
    @first_user = User.create(name: 'Mark', email: 'mark@gmail.com', password: '0123456', confirmed_at: Time.now)

    fill_in 'user_email', with: @first_user.email
    fill_in 'user_password', with: @first_user.password
    click_button 'Log in'
    visit recipes_path
    click_button 'Add a new recipe'
  end

  it 'has food name text box' do
    expect(page.body).to include('placeholder="name.."')
  end

  it 'has food price number field' do
    expect(page.body).to include('placeholder="in hours.."')
  end

  it 'sees add save button' do
    expect(page.has_button?('Create')).to be true
  end

  it 'redirects correctly to the add new food link' do
    fill_in 'recipe_name', with: 'corn special'
    fill_in 'recipe_prep_time', with: 5
    fill_in 'recipe_cook_time', with: 5
    fill_in 'recipe_description', with: 'stuff stuff stuff'
    click_button 'Create'
    expect(page).to have_current_path(recipe_path(@first_user.recipes.last.id))
  end
end
