class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :softdelete, :undosoftdelete]
  before_action :Check_softdelete, only: [:show, :edit, :update]

  # Set Customer deleted_at field to current time
  def softdelete
    @customer.softdelete
    redirect_back(fallback_location: root_path)
  end

  # Set Customer deleted_at field to nil
  def undosoftdelete
    @customer.undosoftdelete
    redirect_back(fallback_location: root_path)
  end

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all.where(deleted_at: nil)
    @customers_soft_deleted = Customer.all.where.not(deleted_at: nil)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email, :phonenumber)
    end

    # Check Customer Not softdeleted
    def Check_softdelete
      @customer = Customer.find(params[:id])
      if @customer.deleted_at != nil
        render html: "Soft Deleted User Cannot edit, show, Update"
      end
    end
end
