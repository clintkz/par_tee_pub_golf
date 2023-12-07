class PubScoresController < ApplicationController
  def show
    @participant = Participant.find(params[:participant_id])
    @game = Game.find(params[@participant.game_id])
    @score = PubScore.New(score_params)
    if @score.save
    else
    end
  end

  def new

  end


  def score_params
    params.require(:participant).permit(:game_id, :participant_id, :pub_id, :score)
  end
end
