require 'rails_helper'

RSpec.feature 'Public Recipes #Index', type: :feature do
  background do
    visit new_user_session_path
    @first_user = User.create(name: 'Mark', email: 'mark@gmail.com', password: '0123456', confirmed_at: Time.now)
    @second_user = User.create(name: 'Griifin', email: 'punk@gmail.com', password: '0123456', confirmed_at: Time.now)

    @mark_recipe = Recipe.create(name: 'mark special', prep_time: 2,
                                 cook_time: 2, description: 'Mark Mark Mark',
                                 user: @first_user, public: false)

    @griifin_recipe = Recipe.create(name: 'Griifin special', prep_time: 3,
                                    cook_time: 3, description: 'Griifin Griifin Griifin',
                                    user: @second_user, public: true)

    fill_in 'user_email', with: @second_user.email
    fill_in 'user_password', with: @second_user.password
    click_button 'Log in'
    visit public_recipes_path
  end

  it 'sees recipe name' do
    expect(page).to have_content('Griifin special')
  end

  it 'sees recipe destription' do
    expect(page).to have_content('Griifin Griifin Griifin')
  end

  it 'sees recipe owner' do
    expect(page).to have_content('Griifin')
  end

  it 'redirects correctly to the recipes detail link' do
    click_link @griifin_recipe.name
    expect(page).to have_current_path(recipe_path(@griifin_recipe.id))
  end
end
