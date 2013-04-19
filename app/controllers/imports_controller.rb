class ImportsController < ApplicationController
  def new
    #Program.import
    @programs = Program.where(status: :draft).where("start_at > ?", Time.now).order("start_at ASC")
  end
end
