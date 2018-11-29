require 'rails_helper'

RSpec.describe 'CRUD tests' do
	
	context "CREATE and READ" do

 		it 'fill true test data' do
			visit(new_post_path)
			fill_in 'post_title', with: 'Test from Capybara post_title'
			fill_in 'post_author', with: 'Test from Capybara post_author'
			fill_in 'post[body]', with: 'Test from Capybara post[body]'
			click_button('Create Post')
			expect(page).to have_current_path(root_path)
			expect(page).to have_content('Пост добавлен')
			expect(page).to have_content('Test from Capybara post_title')
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

  	context "DELETE " do

 		it 'Create and delete' do
			visit(new_post_path)
			fill_in 'post_title', with: 'Test from Capybara post_title'
			fill_in 'post_author', with: 'Test from Capybara post_author'
			fill_in 'post[body]', with: 'Test from Capybara post[body]'
			click_button('Create Post')

			expect(page).to have_current_path(root_path)
			expect(page).to have_content('Пост добавлен')
			expect(page).to have_content('Test from Capybara post_title')
			expect(page).to have_content('Test from Capybara post[body]')

			click_link('Test from Capybara post_title')
			expect(page).to have_content('Test from Capybara post_title')

			click_on(class: "delete")
			expect(page).to have_current_path(root_path)
			# expect(page).to have_current_path(post_path)
		end
  	end

  	context "CHANGE" do
  		it 'Create and change' do
			visit(new_post_path)
			fill_in 'post_title', with: 'Test from Capybara post_title'
			fill_in 'post_author', with: 'Test from Capybara post_author'
			fill_in 'post[body]', with: 'Test from Capybara post[body]'
			click_button('Create Post')

			expect(page).to have_current_path(root_path)
			expect(page).to have_content('Пост добавлен')
			expect(page).to have_content('Test from Capybara post_title')
			expect(page).to have_content('Test from Capybara post[body]')

			click_link('Test from Capybara post_title')
			expect(page).to have_content('Test from Capybara post_title')

			click_on(class: "edit")
			expect(page).to have_current_path('/posts/1/edit')
			# expect(page).to have_content('Test from Capybara post_title')
			# expect(page).to have_content('Test from Capybara post_author')
			# expect(page).to have_content('Test from Capybara post[body]')
			fill_in 'post_title', with: 'Test from Capybara post_title-from test'
			click_button('Edit Post')

			expect(page).to have_current_path("/posts/1")
			expect(page).to have_content('Test from Capybara post_title-from test')
			# expect(page).to have_current_path(post_path)
		end
  	end 
end