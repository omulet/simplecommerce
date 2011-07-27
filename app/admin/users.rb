ActiveAdmin.register User do
	index do
		column "User", :username
		column "Email", :email
		column "Role", :role
		column "Created", :created_at
	end

  	
end
