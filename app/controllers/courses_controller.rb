class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @courses = Course.all
    @pubs = Pub.all
    @courses.each do |course|
      params["#{course.name}"] = course.pubs.geocoded.map do |pub|
        {
          lat: pub.latitude,
          lng: pub.longitude,
          marker_html: render_to_string(partial: "shared/marker")
        }
      end
    end

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
