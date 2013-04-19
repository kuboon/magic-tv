# coding: utf-8

class ProgramsController < ApplicationController
  permits :uid, :url, :name, :description, :start_at, :end_at

  # GET /programs
  def index
    @programs = Program.all
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
      redirect_to @program, notice: 'Program was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /programs/1
  def destroy(id)
    @program = Program.find(id)
    @program.destroy

    redirect_to programs_url
  end
end
