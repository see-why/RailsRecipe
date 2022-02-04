require 'rails_helper'
# rubocop:disable Metrics/BlockLength

RSpec.feature 'Food #Index', type: :feature do
  background do
    visit new_user_session_path
    @first_user = User.create(name: 'Mark', email: 'mark@gmail.com', password: '0123456', confirmed_at: Time.now)

    @mark_post = Food.create(name: 'beans',
                             price: 100, user: @first_user, measurement_unit: 'gram')

    @mark_second_post = Food.create(name: 'sausages',
                                    price: 120, user: @first_user, measurement_unit: 'unit')

    fill_in 'user_email', with: @first_user.email
    fill_in 'user_password', with: @first_user.password
    click_button 'Log in'
    visit foods_path
  end

  it 'sees first food name' do
    expect(page).to have_content('beans')
  end

  it 'sees second food name' do
    expect(page).to have_content('sausages')
  end

  it 'sees first food price' do
    expect(page).to have_content('100')
  end

  it 'sees first food price' do
    expect(page).to have_content('120')
  end

  it 'sees add food button' do
    expect(page.has_link?('Add Food')).to be true
  end

  it 'sees delete button' do
    expect(page.has_button?('Delete')).to be true
  end

  it 'redirects correctly to the add new food link' do
    click_link 'Add Food'
    expect(page).to have_current_path(new_food_path)
  end
end

# rubocop:enable Metrics/BlockLength
