class PubScoresController < ApplicationController
  def create
    @pub_score = PubScore.new(pub_score_params)
    if @pub_score.save
      # Assuming @pub_score belongs to participant, and participant belongs to game
      redirect_to participant_path(@pub_score.participant), notice: 'Score was successfully saved.'
    else
      # Handle the error case
      # You might want to pass the ID of the game or participant to the 'new' template
      # to ensure that the 'new' template can render correctly
      redirect_to participant_path(@pub_score.participant), alert: 'Failed to save score.'
    end
  end

  private

  def pub_score_params
    params.require(:pub_score).permit(:score, :pub_id, :participant_id)
  end
end
