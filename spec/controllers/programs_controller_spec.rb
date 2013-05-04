require 'spec_helper'

describe ProgramsController do
  before do
    @user = create(:user)
  end
  describe 'GET index' do
    subject { get :index }
    before do
      @program = create(:program, status: :ok, start_at: 1.day.since)
    end
    describe 'assigns all programs as @programs' do
      it { subject; assigns(:programs).should eq ([@program]) }
    end
  end

  describe 'GET show' do
    subject(:action) { get :show, id: @program.to_param }
    before do
      @program = create(:program)
    end
    describe 'assigns the requested program as @program' do
      subject { action; assigns(:program) }
      it { should eq(@program) }
    end
  end

  describe 'GET new' do
    before do
      controller.stub(current_user: @user)
      get :new
    end
    describe 'assigns a new program as @program' do
      subject { controller.instance_variable_get('@program') }
      it { should be_a_new(Program) }
    end
  end

  describe 'GET edit' do
    before do
      @program = create(:program, user: @user)
      controller.stub(current_user: @program.user)
      get :edit, id: @program.to_param
    end
    describe 'assigns the requested program as @program' do
      subject { controller.instance_variable_get('@program') }
      it { should eq(@program) }
    end
  end

  describe 'POST create' do
    subject(:action) { post :create, program: attributes }
    before do
      controller.stub(current_user: @user)
    end
    context 'with valid params' do
      let(:attributes){ attributes_for(:program) }
      describe 'creates a new Program' do
        it { expect {
          subject
        }.to change(Program, :count).by(1) }
      end

      describe 'assigns a newly created program as @program and redirects to the created program' do
        subject { action; assigns(:program) }
        it { should be_a(Program) }
        it { should be_persisted }
      end
    end

    context 'with invalid params' do
      let(:attributes){ { "name" => "" } }
      describe "assigns a newly created but unsaved program as @program, and re-renders the 'new' template" do
        subject { action; assigns(:program) }
        it { should be_a_new(Program) }
      end
    end
  end

  describe 'PUT update' do
    before {
      controller.stub(current_user: @user)
      @program = create(:program, user: @user)
    }
    subject(:action) { put :update, id: @program.to_param, program: attributes }
    context 'with valid params' do
      let(:attributes){ attributes_for(:program) }
      describe 'updates the requested program, assigns the requested program as @program, and redirects to the program' do
        subject { action; assigns(:program) }
        it { should eq(@program) }
      end
    end

    context 'with invalid params' do
      let(:attributes){{ start_at: nil }}
      describe "assigns the program as @program, and re-renders the 'edit' template" do
        before do
          Program.any_instance.stub(:save) { false }
        end
        subject { action; controller.instance_variable_get('@program') }
        it { should eq(@program) }
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      controller.stub(current_user: @user)
      @program = create(:program, user: @user)
    end
    it 'destroys the requested program, and redirects to the programs list' do
      expect {
        delete :destroy, id: @program.to_param
      }.to change(Program, :count).by(-1)
    end
  end
end
