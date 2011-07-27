class Category < ActiveRecord::Base
	attr_accessible :description  
	has_many :products
	
	# for the select value/ ROR looks for atributes like name, value, login this is for customized select
	def to_label
		  #{description} 
	end
end
