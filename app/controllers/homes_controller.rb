class HomesController < ApplicationController

  def top
    @events = Event.where("start_at > ?", Time.zone.now).order(:start_at).page(params[:page]).reverse_order
  end

  def about
  end

end
