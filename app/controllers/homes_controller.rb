class HomesController < ApplicationController
  def show
    @presenter = HomePresenter.new
  end
end
