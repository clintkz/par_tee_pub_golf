class ParticipantsController < ApplicationController

  def new
    @participant = Participant.new
    @game = Game.find(params[:game_id])
  end

  def create
    @participant = Participant.new(participant_params)
    # @game = Game.find(params[:game_id])
    # @participant.game = @game
    @participant.user = current_user
    @participant.save
  end

  def show
    @participant = Participant.find(params[:id])
    @user_email = @participant.user.email
    @user_first_name = @participant.user.first_name
    @user_last_name = @participant.user.last_name
    @game = Game.find(params[:game_id])
    @course = @game.course
    @pubs = @game.course.pubs
  end

  def participant_params
    params.permit(:game_id)
  end

  def accept
    participant = current_user.participants.find_by(id: params[:id])
    if participant
      participant.update(status: 'accepted')
      redirect_to game_path(participant.game), notice: 'You have accepted the invite.'
    else
      redirect_to games_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def decline
    participant = current_user.participants.find_by(id: params[:id])
    if participant
      participant.update(status: 'declined')
      redirect_to game_path(participant.game), notice: 'You have declined the invite.'
    else
      redirect_to games_path, alert: 'You are not authorized to perform this action.'
    end
  end

  private

  def current_user_participant(participant_id)
    current_user.participants.find_by(id: participant_id)
  end
end


# def dog_params
#   params.require(:dog).permit(:name, :description, :location, :user_id, photos: [])
# end
