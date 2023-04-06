require 'uri'
require 'net/http'

class ProductSubscription < ApplicationRecord
    belongs_to :product
    belongs_to :user

    def signature
        Digest::SHA2.hexdigest self.url
    end

    def notify!
        unless valid_url?
            raise "InvalidURL"
        end

        uri = URI(self.url)
        res = Net::HTTP.post_form(uri, 'product_id' => self.product_id)

        return res.body
    end
    

    private
    def valid_url?
        true
    end
end
