require 'rails_helper'

RSpec.describe 'Home features' do
	it 'display the name' do
		visit(root_path)
		expect(page).to have_content(I18n.t('blog_title'))
		# click_link('About')
		# expect(current_path).to eql('/about')
		# expect(page).to have_content('About')
	end
end