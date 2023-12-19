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

  def home
    # Code for the home action...
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @pubs = @course.pubs
    # @pub = Pub.find(params[:id])
  end

  def ratings

  end

  private

  def course_params
    params.require(:course).permit(course_ids: [])
  end
end
