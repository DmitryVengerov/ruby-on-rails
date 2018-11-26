require 'rails_helper'

RSpec.describe Console do 

	subject { described_class.new(manufacturer: 'Nintendo', name: 'Wii') }

	describe 'validations' do
		describe 'name' do
			it 'must be present' do
				expect(subject).to be_valid
				subject.name = nil
				expect(subject).to_not be_valid
			end
		end

		describe 'manufacturer' do
			it 'must be present' do
				expect(subject).to be_valid
				subject.manufacturer = nil
				expect(subject).to_not be_valid
			end
		end
	end

	describe '#formatted_name' do
		it 'returns the manufacturer and name in a string' do
			expect(subject.formatted_name).to eql('Nintendo Wii')
		end
	end

	# Console.nintendo that returns 
end


