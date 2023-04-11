class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @events = Event.page(params[:page]).per(10).
              where("start_at > ?", Time.zone.now).order(:start_at)
    if current_user
      @created_events = current_user.created_events.order(:start_at)
      @participating_events = current_user.participating_events.order(:start_at)
    end
  end

end
