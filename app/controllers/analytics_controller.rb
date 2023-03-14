class AnalyticsController < ApplicationController
    # table=products+union+select+cost+from+Products
    def index
        @table = params[:table]

        query = "SELECT COUNT(*) FROM #{@table}"
        results = ActiveRecord::Base.connection.execute(query)

        render json: results
    end
end