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
    @game.user_id = current_user.id
    @game.chatroom = Chatroom.create(name:@course.name)

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

  def index
    @created_games = Game.where(user_id: current_user.id) # Games the user has created
    @invited_games = Game.joins(:participants).where(participants: { user_id: current_user.id }) # Games the user is invited to

    # Ensure there are no duplicates between created and invited games
    @invited_games = @invited_games.where.not(user_id: current_user.id)
  end

  def start
    @game = Game.find(params[:id])
    @game.update(status: "started")
    participant = @game.participants.find_by(user_id: current_user.id)
    redirect_to participant_path(@game, participant.id), notice: 'Game has started!'
  end

  def scorecard
    @game = Game.find(params[:id])
    @pubs = @game.course.pubs
  end

  private

  def game_params
    params.require(:game).permit(:date_time, user_ids: [])
  end
end
