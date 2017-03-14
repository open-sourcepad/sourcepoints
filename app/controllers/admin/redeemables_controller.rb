class Admin::RedeemablesController < ApplicationController

  before_action :set_redeemable, only: [:edit, :update, :destroy]

  def new
    @redeemable = Redeemable.new
  end

  def create
    @redeemable = Redeemable.new(redeemable_params)
    @redeemable.save
  end

  def edit
  end

  def update
    @redeemable.update(redeemable_params)
  end

  def destroy
    @redeemable.destroy
  end

  private
    def set_redeemable
      @redeemable = Redeemable.find(params[:id])
    end

    def redeemable_params
      params.require(:redeemable).permit(
        :id,
        :name,
        :points
      )
    end
end
