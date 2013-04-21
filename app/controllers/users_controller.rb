# coding: utf-8

class UsersController < ApplicationController
  load_and_authorize_resource except: [:omniauth, :unsubscribe]
  permits :name, :email

  # GET /users
  def new
    return redirect_to edit_user_url(current_user) if logged_in?
  end

  # GET /users/1
  def show(id)
  end

  # GET /users/1/edit
  def edit(id)
  end

  # POST /users
  def create
    @user.key = SecureRandom.hex(16)
    if @user.save
      redirect_to root_url, notice: "登録しました"
    else
      render "new"
    end
  end

  def omniauth
    omni_hash = request.env['omniauth.auth'] or return redirect_to root_path, notice: "認証に失敗しました"
    auth = Auth.find_or_create_by_provider_and_uid(omni_hash['provider'], omni_hash['uid'])
    auth.omni_hash = omni_hash
    unless auth.user
      auth.user = User.new(name: omni_hash.info['nickname'], key: SecureRandom.hex(16))
      auth.user.save!(validate: false)
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

  def unsubscribe(user_id)
    user = User.find_by_key!(user_id)
    if user.auths.count > 0
      user.update_column(:email, nil)
    else
      user.destroy
    end
    redirect_to root_url, notice: "登録解除しました"
  end
end
