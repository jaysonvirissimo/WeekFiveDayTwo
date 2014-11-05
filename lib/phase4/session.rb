require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      req.cookies.each do |potential_cookie|
        if potential_cookie.name == 'ruby-on-tracks'
          @cookie_value = JSON.parse(potential_cookie.value)
          return @cookie_value
        end
      end
      @cookie_value = {}
    end

    def [](key)
      @cookie_value[key]
    end

    def []=(key, value)
      @cookie_value[key] = value
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      cookie = WEBrick::Cookie.new('ruby-on-tracks', @cookie_value.to_json)
      res.cookies << cookie
    end
  end
end
