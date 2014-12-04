class HomesController < ApplicationController
  def show
    home = Home.new
    @collisions = home.data
  end
end
