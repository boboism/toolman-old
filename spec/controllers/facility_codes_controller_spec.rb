require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FacilityCodesController do

  # This should return the minimal set of attributes required to create a valid
  # FacilityCode. As you add validations to FacilityCode, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FacilityCodesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all facility_codes as @facility_codes" do
      facility_code = FacilityCode.create! valid_attributes
      get :index, {}, valid_session
      assigns(:facility_codes).should eq([facility_code])
    end
  end

  describe "GET show" do
    it "assigns the requested facility_code as @facility_code" do
      facility_code = FacilityCode.create! valid_attributes
      get :show, {:id => facility_code.to_param}, valid_session
      assigns(:facility_code).should eq(facility_code)
    end
  end

  describe "GET new" do
    it "assigns a new facility_code as @facility_code" do
      get :new, {}, valid_session
      assigns(:facility_code).should be_a_new(FacilityCode)
    end
  end

  describe "GET edit" do
    it "assigns the requested facility_code as @facility_code" do
      facility_code = FacilityCode.create! valid_attributes
      get :edit, {:id => facility_code.to_param}, valid_session
      assigns(:facility_code).should eq(facility_code)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FacilityCode" do
        expect {
          post :create, {:facility_code => valid_attributes}, valid_session
        }.to change(FacilityCode, :count).by(1)
      end

      it "assigns a newly created facility_code as @facility_code" do
        post :create, {:facility_code => valid_attributes}, valid_session
        assigns(:facility_code).should be_a(FacilityCode)
        assigns(:facility_code).should be_persisted
      end

      it "redirects to the created facility_code" do
        post :create, {:facility_code => valid_attributes}, valid_session
        response.should redirect_to(FacilityCode.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved facility_code as @facility_code" do
        # Trigger the behavior that occurs when invalid params are submitted
        FacilityCode.any_instance.stub(:save).and_return(false)
        post :create, {:facility_code => {}}, valid_session
        assigns(:facility_code).should be_a_new(FacilityCode)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FacilityCode.any_instance.stub(:save).and_return(false)
        post :create, {:facility_code => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested facility_code" do
        facility_code = FacilityCode.create! valid_attributes
        # Assuming there are no other facility_codes in the database, this
        # specifies that the FacilityCode created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FacilityCode.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => facility_code.to_param, :facility_code => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested facility_code as @facility_code" do
        facility_code = FacilityCode.create! valid_attributes
        put :update, {:id => facility_code.to_param, :facility_code => valid_attributes}, valid_session
        assigns(:facility_code).should eq(facility_code)
      end

      it "redirects to the facility_code" do
        facility_code = FacilityCode.create! valid_attributes
        put :update, {:id => facility_code.to_param, :facility_code => valid_attributes}, valid_session
        response.should redirect_to(facility_code)
      end
    end

    describe "with invalid params" do
      it "assigns the facility_code as @facility_code" do
        facility_code = FacilityCode.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FacilityCode.any_instance.stub(:save).and_return(false)
        put :update, {:id => facility_code.to_param, :facility_code => {}}, valid_session
        assigns(:facility_code).should eq(facility_code)
      end

      it "re-renders the 'edit' template" do
        facility_code = FacilityCode.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FacilityCode.any_instance.stub(:save).and_return(false)
        put :update, {:id => facility_code.to_param, :facility_code => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested facility_code" do
      facility_code = FacilityCode.create! valid_attributes
      expect {
        delete :destroy, {:id => facility_code.to_param}, valid_session
      }.to change(FacilityCode, :count).by(-1)
    end

    it "redirects to the facility_codes list" do
      facility_code = FacilityCode.create! valid_attributes
      delete :destroy, {:id => facility_code.to_param}, valid_session
      response.should redirect_to(facility_codes_url)
    end
  end

end
