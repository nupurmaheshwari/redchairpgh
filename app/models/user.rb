# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  name       :string
#  location   :string
#  image_url  :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

## ADD METHOD: IS.MENTOR?, IS.MENTEE? 
## ADD ATTRIBUTE: ROLE (ADMIN OR CONTRIBUTOR)

class User < ActiveRecord::Base
  
  def role?(authorized_role)
    return false if role.nil? 
    role.downcase.to_sym == authorized_role 
  end 
  
  def is_mentee?
    return true 
  end 
  
  def is_mentor?
    return true 
  end 
  
  class << self
    def from_omniauth(auth_hash)
      @user = where(uid: auth_hash['uid'], provider: auth_hash['provider']).first#, 
      #role: 'contributor', first_name: auth_hash['info']['first_name'], 
      #last_name: auth_hash['info']['last_name'], image_url: auth_hash['info']['picture_url'])
      puts @user
      puts "user^^^ up there"
      #puts auth_hash
      # # user.location = get_social_location_for user.provider, auth_hash['info']['location']
      # @user.image_url = auth_hash['info']['picture_url']
      # # user.url = get_social_url_for user.provider, auth_hash['info']['urls']
      # puts "HELLO"
      #@user.save
      @user
    end

    private

    def get_social_location_for(provider, location_hash)
      case provider
        when 'linkedin'
          location_hash['name']
        else
          location_hash
      end
    end

    def get_social_url_for(provider, urls_hash)
      case provider
        when 'linkedin'
          urls_hash['public_profile']
        else
          urls_hash[provider.capitalize]
      end
    end
  end


end