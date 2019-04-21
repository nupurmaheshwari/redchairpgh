class User < ApplicationRecord
  #has_secure_password

  #validate :agreed_value

  scope :alphabetical,       -> { order('last_name, first_name') }
  
  # validates :username, presence: true, uniqueness: { case_sensitive: false}
  # validates_presence_of :password, on: :create 
  # validates_presence_of :password_confirmation, on: :create 
  #validates_confirmation_of :password, message: "does not match"
  #validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  
  def name 
    last_name + ", " + first_name
  end 
  
  def role?(authorized_role)
    return false if role.nil? 
    role.downcase.to_sym == authorized_role 
  end 
  
  # def self.authenticate(username,password)
  #   find_by_username(username).try(:authenticate, password)
  # end
  
  def is_mentee?
    return true 
  end 
  
  def is_mentor?
    return true 
  end 
  
  def new_user? 
    return is_new == true 
  end 
  
  def agreed_value
    if agreed != true
      errors.add(:agreed, "must be checked")
    end
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