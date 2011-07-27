ActiveAdmin.register Address  do
	index do
		column "Contact Firstname", :contact_firstname
		column "Contact Lastname",	:contact_lastname
		column "Address Line 1", :address1
		column "Address Line 2", :address2
		column "Zip Code", :zip_code
		column "State", :state
		column "Country", :country
		column "Phone", :phone
		column "Instructions", :instructions
		column "Details" do |address|
			link_to "Details", admin_address_path(address)
		end				
	end
	form do |f|
		f.inputs "User Address" do			
			f.input  :contact_firstname 
			f.input :contact_lastname			
			f.input :address1
			f.input :address2
			f.input :zip_code
			f.input :phone
		end
		f.buttons
	end
  
end
