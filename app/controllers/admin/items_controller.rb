class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre, :price, :is_active)
  end

end
