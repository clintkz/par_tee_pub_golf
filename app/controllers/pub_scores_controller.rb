class PubScoresController < ApplicationController
  def show
    @participant = Participant.find(params[:participant_id])
    @game = Game.find(params[@participant.game_id])
    @score = PubScore.new(score_params)
    @score.save
  end

  def new

  end

  def create
    @participant = Participant.find(params[:participant_id])
    # @game = Game.find(params[@participant.game_id])
    @game = @participant.game
    @pubs = @game.course.pubs
    @pub_score = PubScore.new(score_params)
    @pub_score.participant = @participant
    @pub_score.save
      if @pub_score.pub == @pubs.last
        redirect_to scorecard_game_path(@game)
      else
    redirect_to participant_path(@participant, pub_id: @pub_score.pub.id)
      end
  end

  def total_score

  end

  def score_params
    # params.require(:participant).permit(:game_id, :participant_id, :pub_id, :score)
    # params.permit(:game_id, :participant_id, :pub_id, :score)
    params.require(:pub_score).permit(:score, :pub_id)
  end

  def create
    @pub_score = PubScore.new(pub_score_params)
    if @pub_score.save
      redirect_to participant_path(@pub_score.participant), notice: 'Score was successfully saved.'
    else
      redirect_to participant_path(@pub_score.participant), alert: 'Failed to save score.'
    end
  end

  def pub_score_params
    params.require(:pub_score).permit(:score, :pub_id, :participant_id)
  end
end
