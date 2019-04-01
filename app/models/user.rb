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

class User < ActiveRecord::Base
  class << self
    def from_omniauth(auth_hash)
      #puts "OMG!!!!!!!!!!!!!!!!!"
      #user = where(:uid => auth_hash['uid'])
      #user = find(params[:uid])
      #puts "HAHAHAHHAHA"
      #user.first_name = auth_hash['info']['first_name']
      # user.last_name = auth_hash['info']['last_name']
      # user.location = get_social_location_for user.provider, auth_hash['info']['location']
      # user.image_url = auth_hash['info']['picture_url']
      # user.url = get_social_url_for user.provider, auth_hash['info']['urls']
      #user.save!
      #user 
      @user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'], first_name: auth_hash['info']['first_name'], last_name: auth_hash['info']['last_name'], )
      #@user.first_name = auth_hash['info']['first_name']
      # puts "HO"
      # # user.location = get_social_location_for user.provider, auth_hash['info']['location']
      # @user.image_url = auth_hash['info']['picture_url']
      # # user.url = get_social_url_for user.provider, auth_hash['info']['urls']
      # puts "HELLO"
      # @user.save
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