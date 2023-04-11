class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @event_search_form = EventSearchForm.new(event_seearch_form_params)
    @events = @event_search_form.search

    if current_user
      @created_events = current_user.created_events.order(:start_at)
      @participating_events = current_user.participating_events.order(:start_at)
    end
  end

  private
  
  def event_seearch_form_params
    params.fetch(:event_search_form, {}).permit(:keyword, :start_at).merge(page: params[:page])
  end
end
