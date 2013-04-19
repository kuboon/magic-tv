# coding: utf-8

class ProgramsController < ApplicationController
  permits :uid, :url, :name, :description, :start_at, :end_at, :status

  # GET /programs
  def index
    @programs = Program.where(status: :ok).where("start_at > ?", Time.now).order("start_at ASC")
  end

  # GET /programs/1
  def show(id)
    @program = Program.find(id)
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit(id)
    @program = Program.find(id)
  end

  # POST /programs
  def create(program)
    @program = Program.new(program)

    if @program.save
      redirect_to @program, notice: 'Program was successfully created.'
    else
      render action: 'new'
    end
  end

  # PUT /programs/1
  def update(id, program)
    @program = Program.find(id)

    if @program.update_attributes(program)
      respond_to do |format|
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.js { head :ok }
      end
    else
      respond_to do |format|
        format.html { render action: 'edit' }
        format.js { render json: { errors: @program.errors.messages } }
      end
    end
  end

  # DELETE /programs/1
  def destroy(id)
    @program = Program.find(id)
    @program.destroy

    respond_to do |format|
      format.html { redirect_to programs_url }
      format.js { head :ok }
    end
  end
end
