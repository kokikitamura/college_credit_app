class CoursesController < ApplicationController
  def index
    @courses = Course.where(user_id: current_user.id)
    @categories = Category.where(user_id: current_user.id)
  end

  def show
    @course = Course.find(id: params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      flash[:success] = "追加しました"
      redirect_to courses_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @course = Course.find(id: params[:id])
  end

  def update
    @course = Course.find(id: params[:id])
    if @course.update(course_params)
      flash[:success] = "更新しました"
      redirect_to courses_path
    end
      render "edit", status: :unprocessable_entity
  end

  def destroy
    Course.find(id: params[:id])
    flash[:success] = "削除しました"
    redirect_to courses_path, status: :see_other
  end

  private
    def course_params
      params.require(:course).permit(:name, :credits, :category_id)
    end
end
