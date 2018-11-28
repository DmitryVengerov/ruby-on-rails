require 'rails_helper'

RSpec.describe 'Home features' do
	it 'display the name' do
		visit(new_post_path)
		expect(page).to have_content('Live Blog')
		# expect(current_path).to eql('/about')
		# expect(page).to have_content('About')
	end

	it 'fill true test data' do
		visit(new_post_path)
		fill_in 'post_title', with: 'Test from Capybara post_title'
		fill_in 'post_author', with: 'Test from Capybara post_author'
		fill_in 'post[body]', with: 'Test from Capybara post[body]'
		click_button('Create Post')
		expect(page).to have_current_path(root_path)
		expect(page).to have_content('Пост добавлен')
		expect(page).to have_content('Test from Capybara post_title')
		# expect(page).to have_content('Test from Capybara post_author')
		expect(page).to have_content('Test from Capybara post[body]')
	end

	it 'fill false test data' do
		visit(new_post_path)
		fill_in 'post_title', with: ''
		fill_in 'post_author', with: ''
		fill_in 'post[body]', with: ''
		click_button('Create Post')
		expect(page).to have_current_path('/posts')
		expect(page).to have_content("Title can't be blank")
		expect(page).to have_content("Author can't be blank")
		expect(page).to have_content("Body can't be blank")
	end

end