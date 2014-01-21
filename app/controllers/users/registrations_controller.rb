class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    email = email_md5(user.email)
    response = HTTParty.get("http://www.ohloh.net/accounts/#{email}.xml?api_key=Tc7aQRtw96YtYK3swieiQ")
    badges_info = response.parsed_response
    badges_info['badge'].each do |badge|
      @user.badge_name << badge['name']
      @user.badge_url << badge['image_url']
      @user.badge_pipsurl << badge['pips_url']
    end
  end
end