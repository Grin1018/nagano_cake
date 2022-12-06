class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def show
    @item = Item.find(params[:id])
  end

  def index
    @search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
      redirect_to admin_item_path(@item)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      redirect_to edit_admin_item_path(@item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:introduction, :name, :image, :is_active, :price)
  end
end
