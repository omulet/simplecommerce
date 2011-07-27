ActiveAdmin.register Product do
	
	index do
		column "Name" , :name do |product|
				link_to product.name, admin_product_path(product)
		end
		column "Description", :description
		column "Quantity", :quantity
		column "Price", :price
		column "Category" , :description do |product|
				 Category.find(product.category_id).description
		end
   	 end
    
   show do   	 
   		render  :partial => 'products/admin_product', :locals => {:category => Category.find(product.category_id)}
   	end
   	
   	form  :html => {:multipart => true } do |f|
   		f.inputs Product do
	   		f.input  :name
	   		f.input  :description
	   		f.input  :quantity
	   		f.input  :price	   		
	   	    f.input  :category, :label_method => :description , :include_blank => false
	   	    f.input  :photo,  :as => :file 
   		end
   		
   		f.buttons
   	end
   
   		
end
