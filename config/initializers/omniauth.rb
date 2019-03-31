# LinkedIn.configure do |config|
#   config.client_id     = ENV["78jiaqir16u8ah"]
#   config.client_secret = ENV["rlDe8Wm2s5RtmEuW"]

#   # This must exactly match the redirect URI you set on your application's
#   # settings page. If your redirect_uri is dynamic, pass it into
#   # `auth_code_url` instead.
#   config.redirect_uri  = "https://labs-373-jennyzhu84.c9users.io/login"
# end

# oauth = LinkedIn::OAuth2.new

# url = oauth.auth_code_url

# code = "THE_OAUTH_CODE_LINKEDIN_GAVE_ME"

# access_token = oauth.get_access_token(code)
# api = LinkedIn::API.new(access_token)
# me = api.profile
# my_name = api.profile(fields: ["first-name", "last-name"])
# my_job_titles = api.profile(fields: ["id", {"positions" => ["title"]}])

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV["78jiaqir16u8ah"], ENV["rlDe8Wm2s5RtmEuW"]
end