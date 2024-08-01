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
    ActiveRecord::Base.transaction do
      @monster = Monster.new(user_id: current_user.id, name: params[:name], attribution: params[:attribution], animal: params[:animal], color: params[:color])
  
      if @monster.save
        prompt = "realistic pokemon like, #{params[:attribution]} type, #{params[:animal]} like, #{params[:color]}"
        response = OpenAiService.generate_image(prompt)
        session[:image_url] = response["data"][0]["url"]
        ImageJob.perform_now(@monster, response["data"][0]["url"])
        redirect_to("/user/pokemon_created")
      else
        raise ActiveRecord::Rollback
      end
    end
  rescue => e
    logger.error "Error creating monster: #{e.message}"
    flash[:error] = "モンスターの作成中にエラーが発生しました。"
    redirect_to("/user/pokemon")
  end

  def mypokemon
  end
  def pokemon_created
  end

  def signup_email_sended
  end
  def authenticate_completed
  end

end
