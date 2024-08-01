class UserController < ApplicationController
  before_action :authenticate_user!, except:[:signup_email_sended]
  def mongene
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
        redirect_to("/user/mongene_created")
      else
        raise ActiveRecord::Rollback
      end
    end
  rescue => e
    logger.error "Error creating monster: #{e.message}"
    flash[:error] = "モンスターの作成中にエラーが発生しました。"
    redirect_to("/user/mongene")
  end

  def mymongene

  end
  def mongene_created
  end

  def signup_email_sended
  end
  def authenticate_completed
  end

end
