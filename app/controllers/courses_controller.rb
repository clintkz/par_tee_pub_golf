class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @pubs = @course.pubs
  end

  private

  def course_params
    params.require(:course).permit(course_ids: [])
  end
end
