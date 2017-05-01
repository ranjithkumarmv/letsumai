require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  let(:valid_attributes) {{name: "ranjith", email: "ranjith@gmail.com", phonenumber: "0123456789"}}

  let(:invalid_attributes) {{name: "ranj23ith", email: "ranjith@gmail", phonenumber: "012sss3456789"}}

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all customers as @customers" do
      customer = Customer.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:customers)).to eq([customer])
    end
  end

  describe "GET #show" do
    it "assigns the requested customer as @customer" do
      customer = Customer.create! valid_attributes
      get :show, params: {id: customer.to_param}, session: valid_session
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe "GET #new" do
    it "assigns a new customer as @customer" do
      get :new, params: {}, session: valid_session
      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end

  describe "GET #edit" do
    it "assigns the requested customer as @customer" do
      customer = Customer.create! valid_attributes
      customer.name = "ranjith"
      customer.email = "ranjith@email.com"
      customer.phonenumber = "0123456789"
      get :edit, params: {id: customer.to_param}, session: valid_session
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Customer" do
        expect {
          post :create, params: {customer: valid_attributes}, session: valid_session
        }.to change(Customer, :count).by(1)
      end

      it "assigns a newly created customer as @customer" do
        post :create, params: {customer: valid_attributes}, session: valid_session
        expect(assigns(:customer)).to be_a(Customer)
        expect(assigns(:customer)).to be_persisted
      end

      it "redirects to the created customer" do
        post :create, params: {customer: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Customer.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved customer as @customer" do
        post :create, params: {customer: invalid_attributes}, session: valid_session
        expect(assigns(:customer)).to be_a_new(Customer)
      end

      it "re-renders the 'new' template" do
        post :create, params: {customer: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{name: "ranjith", email: "ranjith@gmail.com", phonenumber: "0123456789"}}

      # it "updates the requested customer" do
      #   customer = Customer.create! valid_attributes
      #   put :update, params: {id: customer.to_param, customer: valid_attributes}, session: valid_session
      #   customer.reload
      #   skip("Add assertions for updated state")
      # end

      it "assigns the requested customer as @customer" do
        customer = Customer.create! valid_attributes
        put :update, params: {id: customer.to_param, customer: valid_attributes}, session: valid_session
        expect(assigns(:customer)).to eq(customer)
      end

      it "redirects to the customer" do
        customer = Customer.create! valid_attributes
        put :update, params: {id: customer.to_param, customer: valid_attributes}, session: valid_session
        expect(response).to redirect_to(customer)
      end
    end

    context "with invalid params" do
      it "assigns the customer as @customer" do
        customer = Customer.create! valid_attributes
        put :update, params: {id: customer.to_param, customer: invalid_attributes}, session: valid_session
        expect(assigns(:customer)).to eq(customer)
      end

      it "re-renders the 'edit' template" do
        customer = Customer.create! valid_attributes
        put :update, params: {id: customer.to_param, customer: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested customer" do
      customer = Customer.create! valid_attributes
      expect {
        delete :destroy, params: {id: customer.to_param}, session: valid_session
      }.to change(Customer, :count).by(-1)
    end

    it "redirects to the customers list" do
      customer = Customer.create! valid_attributes
      delete :destroy, params: {id: customer.to_param}, session: valid_session
      expect(response).to redirect_to(customers_url)
    end
  end

end
