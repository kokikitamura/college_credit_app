class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: current_user.id)
    @all_credits = 0
    @categories.each do |category|
      @all_credits += category.credits if category.root?   #主専攻だけ足す
    end
    @all_credits #単位の総数
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
