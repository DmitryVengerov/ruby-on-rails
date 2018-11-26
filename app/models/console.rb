class Console < ActiveRecord::Base
	validates :name, presence: true
	validates :manufacturer, presence: true

	scope :nintendo, -> { where(manufacturer: 'nintendo')}

	def formatted_name 
		"#{manufacturer} #{name}"
	end
end