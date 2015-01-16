class HomesController < ApplicationController
  def show
    @presenter = HomePresenter.new

    GC.start
  end
end
