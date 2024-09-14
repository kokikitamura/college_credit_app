class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: current_user.id)
    @all_credits = 0
    @categories.each do |category|
      @all_credits += category.credits if category.root?   #親区分だけ足す
    end
    @all_credits #単位の総数
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    if params[:category][:ancestry].empty?
      @category = current_user.categories.build(category_params)
      if @category.save
        flash[:success] = "追加しました"
        redirect_to categories_path
      else
        render 'new', status: :unprocessable_entity
      end
    else
      parent_category = Category.find_by(user_id: current_user.id, id: params[:category][:ancestry])
      @category = parent_category.children.build(category_params)
      if @category.save
        flash[:success] = "追加しました"
        redirect_to categories_path
      else
        render 'new', status: :unprocessable_entity
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def category_params
      params.require(:category).permit(:name, :credits).merge(user_id: current_user.id)
    end
end
