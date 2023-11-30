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
    @game = Game.new
    @pub = Pub.new
  end





  def participant_params
    params.permit(:game_id)
  end
end


# def dog_params
#   params.require(:dog).permit(:name, :description, :location, :user_id, photos: [])
# end
