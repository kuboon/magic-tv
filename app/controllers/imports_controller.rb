class ImportsController < ApplicationController
  def new
    @programs = Program.includes(:base_tags).where(status: :draft).where("start_at > ?", Time.now).order("start_at ASC")
    @current_tags = []
  end
end
