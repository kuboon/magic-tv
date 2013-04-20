# coding: utf-8

class ProgramsController < ApplicationController
  load_and_authorize_resource
  permits :url, :name, :description, :channel, :tag_list, :start_at, :end_at

  # GET /programs
  def index
    @programs = @programs.where(status: :ok).where("start_at > ?", Time.now).order("start_at ASC")
    @current_tags = params[:tag].to_s.split(',')
    @programs = @programs.tagged_with(@current_tags) if @current_tags.present?
  end

  def mail
    render text: UserMailer.programs(current_user).body
  end

  # GET /programs/1
  def show(id)
  end

  # GET /programs/new
  def new
  end

  # GET /programs/1/edit
  def edit(id)
  end

  # POST /programs
  def create(program)
    @program.status = can?(:moderate, :programs) ? :ok : :draft

    if @program.save
      redirect_to @program, notice: '番組情報が投稿されました。モデレータに承認されると他のユーザーにも表示されます。'
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

  def moderate(id, status)
    @program.update_attributes(user_id: current_user.id, status: status)
    head :ok
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
