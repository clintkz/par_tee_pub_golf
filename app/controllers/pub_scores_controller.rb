class PubScoresController < ApplicationController
  def create
    @pub_score = PubScore.new(pub_score_params)
    if @pub_score.save
      redirect_to participant_path(@pub_score.participant), notice: 'Score was successfully saved.'
    else
      redirect_to participant_path(@pub_score.participant), alert: 'Failed to save score.'
    end
  end

  private

  def pub_score_params
    params.require(:pub_score).permit(:score, :pub_id, :participant_id)
  end
end
