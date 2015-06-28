module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      'provider'  =>  'facebook',
      'uid'       =>  1,
      'info' =>  {
        'name'  =>  'Mel Gomez from Facebook'
      },
      'credentials' =>  {
        'token' =>  'CAAT0XFY4RG8BAIiUWxkZAsYNgfIRJoGqKXbbxNHdSkhBtVBrnOkURKL80U9UYuPFvK3hkDoM3ziNH6ZBzEDNrozsKwlmqRfY4CNsuXG8fhZA5zLFpKNveLWj8kNIH8zSy8MBf91vOqh8XDAshtEECBOKtDZB46wlgOTJxZC5J1oA2p3iQbvXpnDr7RNG9BhpSxO3bEJdw49OMLFohdgMX',
        'expires_at'=>  1321747205
      }
    })
  end

  def mock_auth_hash_reset 
    OmniAuth.config.mock_auth[:facebook] = nil 
  end

end