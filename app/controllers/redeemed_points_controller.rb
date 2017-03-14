class RedeemedPointsController < ApplicationController

  before_action :set_redeemable, only: [:edit, :update, :destroy]

  def index
    @redeemed_prizes = RedeemedPoint.joins(:redeemable).all
  end

  def new
    @redeemed_prize = RedeemedPoint.new
  end

  def create
    @redeemed_prize = RedeemedPoint.new(redeemable_params)
    @redeemed_prize.save
  end

  def edit
  end

  def update
    @redeemed_prize.update(redeemable_params)
  end

  private
    def set_redeemable
      @redeemed_prize = RedeemedPoint.find(params[:id])
    end

    def redeemable_params
      params.require(:redeemed_point).permit(
        :user_id,
        :redeemable_id
      )
    end
end
