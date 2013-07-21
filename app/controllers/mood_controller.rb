class MoodController < ApplicationController

  before_action :set_cookie

  def set_cookie
    cookies.permanent[:token] = UUID.new.generate unless cookies[:token]
    @token = cookies[:token]
  end

  def mood_params
    params.require(:mood).permit(:state)
  end

  def summary
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
 
    respond_to do |format|
      if @mood.save
        format.html { redirect_to "/add_note/#{@mood.id}" }
      else
        format.html { render action: 'new' }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_note
    @mood = Mood.find(params[:id])
    if @mood.cookie != cookies[:token]
      redirect_to "/"
    end
  end

  def update
    @mood = Mood.find(params[:mood][:id])
    @mood.notes = params[:mood][:notes]

    if @mood.save()
      redirect_to '/summary'
    else
      respond_to do |format|
        format.html { render action: 'add_note' }
      end
    end
  end

  def stats
  end

  def notes
    @moods = Mood.where.not(notes: nil, notes: '')
  end
end
