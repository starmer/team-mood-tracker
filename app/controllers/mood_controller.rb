class MoodController < ApplicationController

  before_action :set_cookie

  def set_cookie
    cookies.permanent[:token] = UUID.new.generate unless cookies[:token]
    @token = cookies[:token]
  end

  def mood_params
    params.require(:mood).permit(:state)
  end

  def overall
    @moods = Mood.all
    @moods_hash = @moods.inject(Hash.new(0)) do |result, element|
      result[element.state] += 1
      result
    end
  end

  def new
    @mood = Mood.new
  end

  def create
    mood_tmp = mood_params.to_hash.merge(cookie: @token)
    @mood = Mood.new(mood_tmp)
 
    if @mood.save
      redirect_to "/mood/overall"
    else
      respond_to do |format|
        format.html { render action: 'new' }
      end
    end
  end

  def stats
  end

  def notes
  end
end
