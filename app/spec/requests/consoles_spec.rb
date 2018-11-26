require 'rails_helper'

RSpec.describe 'Console requests' do

	let(:url) {'/api/consoles'}
	let(:json) { JSON.parse(response.body)}

	describe 'GET /consoles' do
		

		it 'returns a video games consoles' do
			get(url)
			# json = JSON.parse(response.body) см 6 строчку
			expect(json['consoles']).to contain_exactly('NES','SNES','Wii','Genesis','Xbox','Switch','PS1','PS2')
		end

		it 'include a video games consoles' do
			get(url)
			expect(json['consoles']).to include('NES','SNES','Wii')
		end

		it 'supports specifying consoles for a specific manufacturer' do
			get(url, params: {manufacturer: 'Nintendo'})
			expect(json['consoles']).to contain_exactly("NES", "SNES", "Switch", "Wii")
		end

		it 'supports specifying consoles for a specific manufacturer' do
			get(url, params: {manufacturer: 'Sony'})
			expect(json['consoles']).to contain_exactly("PS1", "PS2")
		end

	end
end
