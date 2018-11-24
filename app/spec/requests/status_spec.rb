require 'rails_helper'

RSpec.describe 'Status requests' do
	describe 'GET /status' do
		it 'returns a status message' do
			get('/api/status')
			json = JSON.parse(response.body)
			# { status: ok }
			expect(json['status']).to eql('ok')
			expect(response.status).to eql(200)
		end

		it 'returns a status code' do
			get('/status')
			expect(response.status).to eql(200)
		end

	end
end