class BuyersController < ApplicationController
  wrap_parameters format: :json
  wrap_parameters :buyer, include: [:first_name, :last_name, :password, :email]
  # before_action :set_buyer, only: [:show, :edit, :update, :destroy]

  def index
    render json: Buyer.all, except: :password_digest
  end

  def show
    buyer = Buyer.find_by(id: params[:id])

    render json: {
      buyer: buyer.as_json( except: :password_digest),
      msg: 'heyyy'
    }

  end

  def create
    buyer = Buyer.new(buyer_params)

    if buyer.valid?
       buyer.save

      render json: { msg: 'succefully created buyer!', buyer: buyer}
    else
      resp = {
        error: buyer.errors.full_messages.to_sentence
      }
      render json: { error: 'failed to create buyer: invalid email or password', buyer: buyer}
    end

  end

  def update
    
    if buyer.update(buyer_params)
      render json: buyer
    else
      render json: buyer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    buyer = Buyer.delete(params[:id])
    render json: buyer
  end

  private
    # Only allow a list of trusted parameters through.
  def buyer_params
    params.require(:buyer).permit(:first_name, :last_name, :password, :email)
  end
end
