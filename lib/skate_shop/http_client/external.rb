require 'net/http'

# Create module to extend Net::HTTP class

module SkateShop
  module HttpClient
    class External < Net::HTTP
      def post(url, options = nil)
        super.post(url, options)
      end
    end
  end
end