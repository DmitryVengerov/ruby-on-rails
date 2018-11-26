class Console
	def initialize(name, manufacturer)
		@name = name
		@manufacturer = manufacturer
	end

	def formatted_name
		"#{@manufacturer} #{@name}"
	end
end

RSpec.describe Console do
	# new instance
	subject {described_class.new('Switch','Nintendo')} 

	describe 'old tests' do
		it 'works'  do
			expect(10).to eql(10)
		end

		it 'true not false' do
			expect(true).to_not be(false)
		end

		it 'true to true' do
			expect(true).to be(true)
		end 
	end 
	
	# -------------------

	describe '#formatted_name' do
		it 'returns the manufacturer and the console name together' do
			expect(subject.formatted_name).to eql('Nintendo Switch')
		end
 	end

 	describe '.nintendo' do
 		it 'returns an ActiveRecord::Relation of consoles manufacturered by Nintendo' do
 			
 			wii = described_class.create(manufacturer: 'Nintendo', name: 'Wii')
 			switch = described_class.create(manufacturer: 'Nintendo', name: 'Switch')
 			ps4 = described_class.create(manufacturer: 'Sony', name: 'PS4')

 			expect(described_class.nintendo).to contain_exactly(wii,switch)
 		end
 	end


end