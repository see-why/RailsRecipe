require 'rails_helper'
# rubocop:disable Metrics/BlockLength

RSpec.feature 'Recipe #Index', type: :feature do
  background do
    visit new_user_session_path
    @first_user = User.create(name: 'Mark', email: 'mark@gmail.com', password: '0123456', confirmed_at: Time.now)

    @mark_food = Food.create(name: 'beans',
                             price: 100, user: @first_user, measurement_unit: 'gram')

    @mark_second_food = Food.create(name: 'sausages',
                                    price: 120, user: @first_user, measurement_unit: 'unit')

    @mark_recipe = Recipe.create(name: 'mark special', prep_time: 2,
                                 cook_time: 2, description: 'Mark Mark Mark',
                                 user: @first_user)

    @mark_second_recipe = Recipe.create(name: 'mark second special', prep_time: 2,
                                        cook_time: 2, description: 'Mark Second Mark Second Mark',
                                        user: @first_user)

    fill_in 'user_email', with: @first_user.email
    fill_in 'user_password', with: @first_user.password
    click_button 'Log in'
    visit recipes_path
  end

  it 'sees first recipe name' do
    expect(page).to have_content('mark special')
  end

  it 'sees second recipe name' do
    expect(page).to have_content('mark second special')
  end

  it 'sees first recipe destription' do
    expect(page).to have_content('Mark Mark Mark')
  end

  it 'sees first recipe destription' do
    expect(page).to have_content('Mark Second Mark Second Mark')
  end

  it 'sees add new recipe button' do
    expect(page.has_button?('Add a new recipe')).to be true
  end

  it 'sees delete button' do
    expect(page.has_button?('Delete')).to be true
  end

  it 'redirects correctly to the add new food link' do
    click_button 'Add a new recipe'
    expect(page).to have_current_path(new_recipe_path)
  end
end

# rubocop:enable Metrics/BlockLength
