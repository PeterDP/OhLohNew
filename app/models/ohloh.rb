class Ohloh
  def create
    response = HTTParty.get('http://www.ohloh.net/accounts/c0bdf7faa755d2548e5ad867fd424535.xml?api_key=Tc7aQRtw96YtYK3swieiQ')
    badges_info = response.parsed_response['response']['result']['account']['badges']
    binding.pry

  end
end