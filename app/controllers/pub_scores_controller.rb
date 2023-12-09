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
        redirect_to scorecard_path(@game)
      else
    redirect_to participant_path(@participant, pub_id: @pub_score.pub.id + 1)
      end
  end

  def score_params
    # params.require(:participant).permit(:game_id, :participant_id, :pub_id, :score)
    # params.permit(:game_id, :participant_id, :pub_id, :score)
    params.require(:pub_score).permit(:score, :pub_id)
  end
end
