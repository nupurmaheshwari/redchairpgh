class OauthAccount < ApplicationRecord
    
  # Relationships
  belongs_to :user
  
  validates_presence_of :provider, :uid, :image_url, :profile_url, :access_token

end