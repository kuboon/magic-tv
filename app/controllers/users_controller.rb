# coding: utf-8

class UsersController < ApplicationController
  load_and_authorize_resource
  permits :name, :email

  # GET /users
  def index
  end

  # GET /users/1
  def show(id)
  end

  # GET /users/1/edit
  def edit(id)
  end

  # POST /users
  def create
    omni_hash = request.env['omniauth.auth'] or return redirect_to root_path, error: "認証に失敗しました"
    auth = Auth.find_or_create_by_provider_and_uid(omni_hash['provider'], omni_hash['uid'])
    auth.omni_hash = omni_hash
    unless auth.user
      auth.user = User.new(name: omni_hash.info['nickname'])
    end
    auth.save!

    auto_login(auth.user)
    redirect_to root_url, notice: "ログインしました"
  end

  # PUT /users/1
  def update(id, user)
    if @user.update_attributes(user)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy(id)
    @user.destroy

    redirect_to users_url
  end
end
