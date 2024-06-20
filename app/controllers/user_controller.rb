class UserController < ApplicationController
  def login
  end
  def individual
    @id=session[:user_id]
  end
  def edit
    @id=session[:user_id]
  end
  def useredit
    @user=@current_user
    @user.name=params[:name]
    @user.email=params[:email]
    @user.save
    redirect_to("/user/#{@user.id}")
  end

  def pokemon
    @image_url = session[:image_url]

  end

  def create
    @monster=Monster.new(user_id:current_user.id, name:params[:name],attribution:params[:attribution],animal:params[:animal], color:params[:color])
    if @monster.save
      prompt="realistic pokemon like, #{params[:attribution]} type, #{params[:animal]} like, #{params[:color]}"
      response=OpenAiService.generate_image(prompt)
      session[:image_url]=response["data"][0]["url"]
      ImageJob.perform_now(@monster,response["data"][0]["url"])
      @monster.save
      redirect_to("/user/pokemon_created")  
    end
  end

  def mypokemon
  end
  def pokemon_created
  end

  def signup_email_sended
  end


end
