require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:user) { create(:user) }
  let(:application) { create(:RegisteredApplication, user: user) }

context "logged out" do
  describe "GET #index" do
    it "returns http redirect" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "GET #show" do
    it "returns http redirect" do
      get :show, params: { id: application.id }
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "GET #new" do
    it "returns http redirect" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "POST #create" do
    it "returns http redirect" do
      post :create, params: { RegisteredApplication: { name: FFaker::Internet.domain_word, URL: FFaker::Internet.http_url } }
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "DELETE #destroy" do
    it "returns http redirect" do
      delete :destroy, params: { id: application.id }
      expect(response).to redirect_to new_user_session_path
    end
  end
end

context "logged in" do
  before(:each) do
    sign_in(user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns the users registered applications to @applications" do
      get :index
      expect(assigns(:applications)).to eq user.RegisteredApplications.all
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: application.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, params: { id: application.id }
      expect(response).to render_template(:show)
    end

    it "assigns the registered application to @application" do
      get :show, params: { id: application.id }
      expect(assigns(:application)).to eq application
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates @application" do
      get :new
      expect(assigns(:application)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the amount of registered applications by 1" do
      expect{ post :create, params: { registered_application: { name: FFaker::Internet.domain_word, URL: FFaker::Internet.http_url } } }.to change(RegisteredApplication,:count).by (1)
    end

    it "assigns the new application to @application" do
      post :create, params: { registered_application: { name: FFaker::Internet.domain_word, URL: FFaker::Internet.http_url } }
      expect(assigns(:application)).to eq user.RegisteredApplications.last
    end

    it "redirects to the application index" do
      post :create, params: { registered_application: { name: FFaker::Internet.domain_word, URL: FFaker::Internet.http_url } }
      expect(response).to redirect_to registered_applications_path
    end
  end

  describe "DELETE #destroy" do
    it "deletes the registered application" do
      delete :destroy, params: { id: application.id }
      count = user.RegisteredApplications.where({id: application.id}).count
      expect(count).to eq 0
    end

    it "redirects to the users registered applications index" do
      delete :destroy, params: { id: application.id }
      expect(response).to redirect_to registered_applications_path
    end
  end
end

end
