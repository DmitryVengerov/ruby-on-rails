require 'rails_helper'

RSpec.describe 'Status requests' do
	
	let(:response_json) {JSON.parse(response.body)}
	let(:url) {'/api/status'}

	describe 'GET /status' do
		it 'returns a status message' do
			get(url)
			expect(response_json['status']).to eql('ok')
		end

		it 'returns a status code' do
			get(url)
			expect(response.status).to eql(200)
		end

	end
end