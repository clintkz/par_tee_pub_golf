class GamesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @game = Game.new
    @users = User.all # List of potential participants
  end

  def create
    @course = Course.find(params[:course_id])
    @game = Game.new(game_params)
    @game.course = @course
    #@game.owner = current_user
    if @game.save
      # Add participants to the game
      # game_params[:user_ids].each do |user_id|
      #   Participant.create(user_id: user_id, game: @game) unless user_id.nil?
      # end
      puts "redirecting to games page"
      redirect_to game_path(@game), notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @participants = @game.participants.includes(:user)
  end

  private

  def game_params
    params.require(:game).permit(:date_time, user_ids: [])
  end
end
