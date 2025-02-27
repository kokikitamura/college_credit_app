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
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:success] = "追加しました"
      redirect_to categories_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "更新しました"
      redirect_to categories_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to categories_path, status: :see_other
  end

  private
    def category_params
      params[:category][:ancestry] = nil if params[:category][:ancestry].blank?
      params.require(:category).permit(:name, :credits, :ancestry).merge(user_id: current_user.id)
    end
end
