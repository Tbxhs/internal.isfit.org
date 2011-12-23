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

describe IsfitPagesController do

  # This should return the minimal set of attributes required to create a valid
  # IsfitPage. As you add validations to IsfitPage, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all isfit_pages as @isfit_pages" do
      isfit_page = IsfitPage.create! valid_attributes
      get :index
      assigns(:isfit_pages).should eq([isfit_page])
    end
  end

  describe "GET show" do
    it "assigns the requested isfit_page as @isfit_page" do
      isfit_page = IsfitPage.create! valid_attributes
      get :show, :id => isfit_page.id
      assigns(:isfit_page).should eq(isfit_page)
    end
  end

  describe "GET new" do
    it "assigns a new isfit_page as @isfit_page" do
      get :new
      assigns(:isfit_page).should be_a_new(IsfitPage)
    end
  end

  describe "GET edit" do
    it "assigns the requested isfit_page as @isfit_page" do
      isfit_page = IsfitPage.create! valid_attributes
      get :edit, :id => isfit_page.id
      assigns(:isfit_page).should eq(isfit_page)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new IsfitPage" do
        expect {
          post :create, :isfit_page => valid_attributes
        }.to change(IsfitPage, :count).by(1)
      end

      it "assigns a newly created isfit_page as @isfit_page" do
        post :create, :isfit_page => valid_attributes
        assigns(:isfit_page).should be_a(IsfitPage)
        assigns(:isfit_page).should be_persisted
      end

      it "redirects to the created isfit_page" do
        post :create, :isfit_page => valid_attributes
        response.should redirect_to(IsfitPage.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved isfit_page as @isfit_page" do
        # Trigger the behavior that occurs when invalid params are submitted
        IsfitPage.any_instance.stub(:save).and_return(false)
        post :create, :isfit_page => {}
        assigns(:isfit_page).should be_a_new(IsfitPage)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        IsfitPage.any_instance.stub(:save).and_return(false)
        post :create, :isfit_page => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested isfit_page" do
        isfit_page = IsfitPage.create! valid_attributes
        # Assuming there are no other isfit_pages in the database, this
        # specifies that the IsfitPage created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        IsfitPage.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => isfit_page.id, :isfit_page => {'these' => 'params'}
      end

      it "assigns the requested isfit_page as @isfit_page" do
        isfit_page = IsfitPage.create! valid_attributes
        put :update, :id => isfit_page.id, :isfit_page => valid_attributes
        assigns(:isfit_page).should eq(isfit_page)
      end

      it "redirects to the isfit_page" do
        isfit_page = IsfitPage.create! valid_attributes
        put :update, :id => isfit_page.id, :isfit_page => valid_attributes
        response.should redirect_to(isfit_page)
      end
    end

    describe "with invalid params" do
      it "assigns the isfit_page as @isfit_page" do
        isfit_page = IsfitPage.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        IsfitPage.any_instance.stub(:save).and_return(false)
        put :update, :id => isfit_page.id, :isfit_page => {}
        assigns(:isfit_page).should eq(isfit_page)
      end

      it "re-renders the 'edit' template" do
        isfit_page = IsfitPage.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        IsfitPage.any_instance.stub(:save).and_return(false)
        put :update, :id => isfit_page.id, :isfit_page => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested isfit_page" do
      isfit_page = IsfitPage.create! valid_attributes
      expect {
        delete :destroy, :id => isfit_page.id
      }.to change(IsfitPage, :count).by(-1)
    end

    it "redirects to the isfit_pages list" do
      isfit_page = IsfitPage.create! valid_attributes
      delete :destroy, :id => isfit_page.id
      response.should redirect_to(isfit_pages_url)
    end
  end

end
