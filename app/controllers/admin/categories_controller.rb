# frozen_string_literal: true

module Admin
  class CategoriesController < Admin::AdminController
    before_action :find_category, only: %i[edit update destroy]
    def index
      render json: ProductCategory.all
    end

    def new; end

    def create; end

    def edit; end

    def update; end

    def destroy
      @category.destroy
    end

    private

    def find_category
      @category = Category.find(params[:id])
    end
  end
end
