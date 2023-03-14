# frozen_string_literal: true

module Admin
  class ReviewsController < Admin::AdminController
    before_action :find_review, only: %i[edit update destroy]

    def index; end

    def show; end

    def edit; end

    def update; end

    def destroy; end

    private

    def find_review
      @review = Review.find(params[:id])
    end
  end
end
