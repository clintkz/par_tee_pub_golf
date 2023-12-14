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
      # Automatically add the organizer as a participant
      Participant.create(user_id: current_user.id, game: @game)

      # Add other participants to the game
      # user_ids = game_params[:user_ids].reject(&:blank?)
      # user_ids.each do |user_id|
      #   Participant.create(user_id: user_id, game: @game) unless user_id == current_user.id
      # end
      puts "redirecting to games page"
      redirect_to game_path(@game), notice: 'Game was successfully created.'
    else
      @users = User.all # Ensure @users is set for the form
      flash.now[:alert] = @game.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @participants = @game.participants.includes(:user)
  end

  def index
    @created_games = Game.where(user_id: current_user.id).where.not(status: 'started')

    @invited_games = Game.joins(:participants)
                         .where(participants: { user_id: current_user.id }) # Games the user is invited to
                         .where.not(user_id: current_user.id)
                         .where.not(status: 'started')

    @started_games = Game.where(status: 'started')
                         .where(id: Game.joins(:participants)
                         .where(participants: { user_id: current_user.id }).pluck(:id))
  end

  def start
    @game = Game.find(params[:id])
    @game.update(status: "started")
    participant = @game.participants.find_by(user_id: current_user.id)
    redirect_to participant_path(participant.id), notice: 'Game has started!'
  end

  def scorecard
    @game = Game.find(params[:id])
    @participants = @game.participants
    @pubs = @game.course.pubs
  end

  private

  def game_params
    params.require(:game).permit(:date_time, user_ids: [])
  end
end
