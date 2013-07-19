class ScoresController < ApplicationController

  def show
    
  end

  def create
    @score = Score.new
    @score.specific = params[:score][:specific]
    @score.actionable = params[:score][:actionable]
    @score.kind = params[:score][:kind]
    @score.user = current_user
    @score.topic_id = params[:topic_id]

    if @score.save
      render '_feedback', :score => @score
    else
      render :json => {message: "fail!"}
    end
  end

end
