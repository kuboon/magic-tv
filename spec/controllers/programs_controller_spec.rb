require 'spec_helper'

describe ProgramsController do
  # This should return the minimal set of attributes required to create a valid
  # Program. As you add validations to Program, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "uid" => "MyString" }
  end

  describe 'GET index' do
    before do
      @program = Program.create! valid_attributes
      controller.index
    end
    describe 'assigns all programs as @programs' do
      subject { controller.instance_variable_get('@programs') }
      it { should eq([@program]) }
    end
  end

  describe 'GET show' do
    before do
      @program = Program.create! valid_attributes
      controller.show(@program.to_param)
    end
    describe 'assigns the requested program as @program' do
      subject { controller.instance_variable_get('@program') }
      it { should eq(@program) }
    end
  end

  describe 'GET new' do
    before do
      controller.new
    end
    describe 'assigns a new program as @program' do
      subject { controller.instance_variable_get('@program') }
      it { should be_a_new(Program) }
    end
  end

  describe 'GET edit' do
    before do
      @program = Program.create! valid_attributes
      controller.edit(@program.to_param)
    end
    describe 'assigns the requested program as @program' do
      subject { controller.instance_variable_get('@program') }
      it { should eq(@program) }
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      before do
        controller.should_receive(:redirect_to) {|u| u.should eq(Program.last) }
      end
      describe 'creates a new Program' do
        it { expect {
          controller.create(valid_attributes)
        }.to change(Program, :count).by(1) }
      end

      describe 'assigns a newly created program as @program and redirects to the created program' do
        before do
          controller.create(valid_attributes)
        end
        subject { controller.instance_variable_get('@program') }
        it { should be_a(Program) }
        it { should be_persisted }
      end
    end

    context 'with invalid params' do
      describe "assigns a newly created but unsaved program as @program, and re-renders the 'new' template" do
        before do
          Program.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'new')
          controller.create({ "uid" => "invalid value" })
        end
        subject { controller.instance_variable_get('@program') }
        it { should be_a_new(Program) }
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      describe 'updates the requested program, assigns the requested program as @program, and redirects to the program' do
        before do
          @program = Program.create! valid_attributes
          controller.should_receive(:redirect_to).with(@program, anything)
          controller.update(@program.to_param, valid_attributes)
        end
        subject { controller.instance_variable_get('@program') }
        it { should eq(@program) }
      end
    end

    context 'with invalid params' do
      describe "assigns the program as @program, and re-renders the 'edit' template" do
        before do
          @program = Program.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Program.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'edit')
          controller.update(@program.to_param, { "uid" => "invalid value" })
        end
        subject { controller.instance_variable_get('@program') }
        it { should eq(@program) }
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      @program = Program.create! valid_attributes
      controller.stub(:programs_url) { '/programs' }
      controller.should_receive(:redirect_to).with('/programs')
    end
    it 'destroys the requested program, and redirects to the programs list' do
      expect {
        controller.destroy(@program.to_param)
      }.to change(Program, :count).by(-1)
    end
  end
end
