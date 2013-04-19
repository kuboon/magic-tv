class ImportsController < ApplicationController
  def new
    #Program.import
    @programs = Program.where(status: :import).where("start_at > ?", Time.now).order("start_at ASC")
  end

  def create

  end
end
