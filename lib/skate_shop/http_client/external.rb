require 'net/http'

# Create module to extend Net::HTTP class

module SkateShop
  module HttpClient
    class External < Net::HTTP
      def self.post(url, data, options = nil)
        self.validate_url!(url)

        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, nil, "196.189.44.49", "1234")

        res = http.post(uri, data, options)
      end

      private
      def self.validate_url!(url)
        raise "InvalidProtocol" unless url =~ /^https/
      end
    end
  end
end