class PubScoresController < ApplicationController
  def score

    @participant = Participant.find(params[:participant_id])
    @game = Game.find(params[@participant.game_id])
    @score = PubScore.New(score_params)
    if @score.save
      puts "your score is saved"
    else
      "Please enter your score before proceeding"
    end
  end




  def score_params
    params.require(:participant).permit(:game_id, :participant_id, :pub_id)
end
