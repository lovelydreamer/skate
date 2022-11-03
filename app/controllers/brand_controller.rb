class BrandController < ApplicationController
    before_action :set_csp_exceptions

    # TODO: Utilize CSP Exceptions
    # TODO: Build layout
    def index
        
    end
    
    private
    def set_csp_exceptions
        use_secure_headers_override(:script_from_otherdomain_com)
    end
end
