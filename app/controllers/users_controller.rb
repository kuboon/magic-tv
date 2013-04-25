# coding: utf-8

class UsersController < ApplicationController
  permits :name, :email

  before_filter do
    @user = current_user || User.new(params[:user])
  end

  def new
    return redirect_to edit_user_url if logged_in?
  end

  def show
  end

  def edit
  end

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
      auth.user = User.new(name: omni_hash.info['nickname'])
      auth.user.save!(validate: false)
    end
    auth.save!

    auto_login(auth.user)
    redirect_to root_url, notice: "ログインしました"
  end

  def update(user)
    if @user.update_attributes(user)
      redirect_to user_url , notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy

    redirect_to root_url, notice: "User was successfully deleted."
  end

  def resend_activation
    if @user.email.present?
      UserMailer.activate(@user).deliver
      redirect_to root_url, notice: "確認メールを送信しました"
    else
      redirect_to root_url, notice: "メールアドレスが登録されていません"
    end
  end

  def activate(key)
    user = User.find_by_key!(key)
    user.update_column(:email_active, true)
    redirect_to root_url, notice: "メールアドレスを確認しました"
  end

  def unsubscribe(key)
    user = User.find_by_key!(key)
    if user.auths.count > 0
      user.update_column(:email, nil)
    else
      user.destroy
    end
    redirect_to root_url, notice: "登録解除しました"
  end
end
