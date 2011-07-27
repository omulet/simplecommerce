ActiveAdmin.register Delivery do
  
	index do
		column "Delivery Mode" , :delivery_mode, :sortable => true do |delivery|
				link_to delivery.delivery_mode, admin_delivery_path(delivery)
		end
		column "Delivery Fee", :delivery_fee
		
	end
end
