class CreateFacebookAccount < ActiveRecord::Migration
  def change
    create_table :facebook_accounts do |t|
       t.integer  :user_id
       t.boolean  :active,              :default => false
       t.text     :stream_url
       t.text     :access_token
       t.text     :oauth_authorize_url
       
       t.timestamps
       #t.datetime :created_at
       #t.datetime :updated_at
     end
  end
end
