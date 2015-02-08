class HomesController < ApplicationController
  def show
    @presenter = HomePresenter.new
    fresh_when last_modified: Incident.maximum(:created_at), public: true
  end
end
