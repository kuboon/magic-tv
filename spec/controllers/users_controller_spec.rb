require 'spec_helper'

describe UsersController do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "email" => "test@example.com" }
  end

  describe 'GET show' do
    before do
      @user = create :user
      controller.stub(current_user: @user)
      get :show
    end
    describe 'assigns the requested user as @user' do
      subject { controller.instance_variable_get('@user') }
      it { should eq(@user) }
    end
  end

  describe 'GET new' do
    before do
      get :new
    end
    describe 'assigns a new user as @user' do
      subject { controller.instance_variable_get('@user') }
      it { should be_a_new(User) }
    end
  end

  describe 'GET edit' do
    before do
      @user = create :user
      controller.stub(current_user: @user)
      get :edit
    end
    describe 'assigns the requested user as @user' do
      subject { controller.instance_variable_get('@user') }
      it { should eq(@user) }
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      describe 'creates a new User' do
        it { expect {
          post :create, user: valid_attributes
        }.to change(User, :count).by(1) }
      end

      describe 'assigns a newly created user as @user and redirects to the created user' do
        before do
          post :create, user: valid_attributes
        end
        subject { controller.instance_variable_get('@user') }
        it { should be_a(User) }
        it { should be_persisted }
      end
    end

    context 'with invalid params' do
      describe "assigns a newly created but unsaved user as @user, and re-renders the 'new' template" do
        before do
          User.any_instance.stub(:save) { false }
          controller.stub(current_user: @user)
          post :create, user:{ "name" => "invalid value" }
        end
        subject { controller.instance_variable_get('@user') }
        it { should be_a_new(User) }
        it { response.should render_template('new') }
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      describe 'updates the requested user, assigns the requested user as @user, and redirects to the user' do
        before do
          @user = create :user
          controller.stub(current_user: @user)
          put :update, valid_attributes
        end
        subject { controller.instance_variable_get('@user') }
        it { should eq(@user) }
      end
    end

    context 'with invalid params' do
      describe "assigns the user as @user, and re-renders the 'edit' template" do
        before do
          @user = create :user
          # Trigger the behavior that occurs when invalid params are submitted
          User.any_instance.stub(:save) { false }
          controller.stub(current_user: @user)
          put :update, user:{ "name" => "invalid value" }
        end
        it { controller.instance_variable_get('@user').should eq(@user) }
        it { response.should render_template('edit') }
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      @user = create :user
      controller.stub(current_user: @user)
    end
    it 'destroys the requested user, and redirects to the users list' do
      expect {
        delete :destroy
      }.to change(User, :count).by(-1)
    end
  end
end
