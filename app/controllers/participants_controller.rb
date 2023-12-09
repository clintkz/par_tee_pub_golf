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
    # @game = Game.find(params[:game_id])

    @game = @participant.game
    @course = @game.course
    @pubs = @course.pubs
    if params[:pub_id].nil?
      @pub = @pubs[0]
    else
      @pub_index = @pubs.find_index(@pubs.find(params[:pub_id]))
      @pub = @pubs[@pub_index +1]
    end
    @pub_score = PubScore.new(pub_id: @pub.id)
    @pub_index = @pubs.find_index(@pubs.find(@pub.id))
    @last_element = @pubs.size - 1 == @pub_index
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

  def mark_as_arrived
    participant = current_user.participants.find_by(id: params[:id], game_id: params[:game_id])
    if participant
      participant.update(arrived: true)
      redirect_to game_path(participant.game), notice: 'You have been marked as arrived.'
    else
      redirect_to games_path, alert: 'You are not authorized to perform this action.'
    end
  end

  # def save_score
  #   pub_score = PubScore.find_or_initialize_by(participant_id: params[:participant_id], pub_id: params[:pub_score][:pub_id])
  #   pub_score.score = params[:pub_score][:score]

  #   if pub_score.save
  #     redirect_to game_scorecard_path(pub_score.participant.game), notice: "Score updated!"
  #   else
  #     redirect_to game_scorecard_path(pub_score.participant.game), alert: "Failed to update score."
  #   end
  # end

  private

  def current_user_participant(participant_id)
    current_user.participants.find_by(id: participant_id)
  end
end
