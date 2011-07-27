ActiveAdmin.register Category do
    index do
  		column "Description", :sortable => :description do |category|
  				link_to category.description, admin_category_url(category)
  			end
  			
  	end
  	form do |f|
  		f.inputs "Category" do
  			f.input :description
  			end
  		f.buttons  			
  	end
  	#show do
  		#render partial
  	#end
  	
  	sidebar :help do
   		 "Need help? Email us at help@example.com"
  	end
  		
end
