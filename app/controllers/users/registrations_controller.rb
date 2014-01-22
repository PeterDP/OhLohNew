class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    email = @user.email_md5
    response = HTTParty.get("http://www.ohloh.net/accounts/#{email}.xml?api_key=Tc7aQRtw96YtYK3swieiQ")
    badges_info = response.parsed_response['response']['result']['account']['badges']
    badges_info['badge'].each do |uniq_badge|
      Badges.find_or_create_by(name: uniq_badge['name']) do |badge|
      badge.name = uniq_badge['name']
      badge.url =  uniq_badge['image_url']
      badge.pips_url = uniq_badge['pips_url']
      end
    end
  end
end
