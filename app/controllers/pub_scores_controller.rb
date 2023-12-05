class PubScoresController < ApplicationController
  #before_action :require_login

  def round_entry
    @participant = Participants.find_by(id: params[:participant_id])
    @n=0
    @i=0
  end

  def create
    participant=Participant.find_by(id: params[:participant_id].to_i)
    params[:pub_scores].each do |pub_score|
      if pub_score[:score].blank?
        return redirect_to "/participants/#{participant.id}/pub_scores/round_entry", alert: "Please enter a score for each pubs before submiting."
      end
    end

    if helpers.current_user.games_id.include?(participant.game_id)
      round=Round.create(round_params)
      if !round.blank?
          create_pub_scores_from_round(round)
      end
    end
 redirect_to "/games/#{participant.game.id}/posting"
  end

  end
