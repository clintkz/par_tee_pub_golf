class ParticipantsController < ApplicationController

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
