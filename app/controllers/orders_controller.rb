class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/new
  def new
    @listing = Listing.find(params[:listing_id])
    if params.include?(:order)
      @order = Order.new(order_params)
      @valid_info = @order.valid?
    else
      @order = Order.new
    end
  end

  # GET /orders/1/edit


  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @listing = Listing.find(params[:listing_id])
    @vendor = @listing.user
    @order.listing_id = @listing.id
    @order.buyer_id = current_user.id
    @order.vendor_id = @vendor.id
    @valid_info = @order.valid?
    @amount = @listing.price

    if params[:order][:step] == '1' and @valid_info
      render :new
    else
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )

      respond_to do |format|
        if @order.save
          format.html { redirect_to listing_url(@listing), notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    # redirect_to listing_url(@listing)
    render :new
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /orders/1
  # DELETE /orders/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state, :postcode)
    end
end
