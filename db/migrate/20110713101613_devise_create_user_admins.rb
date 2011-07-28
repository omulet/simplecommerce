class DeviseCreateUserAdmins < ActiveRecord::Migration
  def self.up
    create_table :user_admins do |t|
      t.database_authenticatable :null => false      
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    # Create a default user
    UserAdmin.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')

    add_index :user_admins, :email,                :unique => true
    add_index :user_admins, :reset_password_token, :unique => true
    # add_index :user_admins, :confirmation_token,   :unique => true
    # add_index :user_admins, :unlock_token,         :unique => true
    # add_index :user_admins, :authentication_token, :unique => true
  end

  def self.down
    drop_table :user_admins
  end
end
