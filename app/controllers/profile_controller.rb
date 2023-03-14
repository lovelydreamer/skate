# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]

  def show; end

  def edit; end

  def update; end
end
