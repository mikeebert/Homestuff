class ItemsController < ApplicationController
  
  before_filter :require_user
  
  def index
    @items = @user.items
    
    if params[:item].present?
      @items = @items.where(["name LIKE ?", "%#{params[:item]}%"])
    end
    
    if params[:condition].present?
      @items = @items.where(:condition_id => params[:condition])
    end
    
    if params[:category].present?
      @items = @items.where(:category_id => params[:category])
    end

    @items= @items.page(params[:page]).per(5)
    @item = Item.new      

  end
  
  def new
    @item = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])    
  end
  
  def create 
    @item = Item.new(params[:item])
    user = User.find(session[:user_id])
    @item.user = user
    
    if @item.save
      redirect_to items_url, :notice => "Item has been added."
    else
      render :new, :notice => "Error. Please try again"
    end
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.save
      redirect_to items_url, :notice => "Item succesfully updated"
    else
      redirecto_to edit_item_url, :notice => "There was an error updating your item. Please try again."
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_url, :notice => "Your item has been deleted"
  end
  
end