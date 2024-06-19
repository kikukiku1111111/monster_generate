class HomeController < ApplicationController
  def top
    if current_user
      redirect_to("/user/mypokemon")
    end
  end
  def member
    @users=User.all
  end
  
  def create
    @user=User.new(name:params[:name],email:params[:email],password:params[:password])
    @user.save
    redirect_to("/home/top")
  end
  def in
    @user=User.find_by(email:params[:email],password:params[:password])
      if @user
        session[:user_id]=@user.id
        redirect_to("/home/top") 
      else
        redirect_to("/home/top") 
      end
  end

  def logout
    session[:user_id]=nil
    redirect_to("/home/top") 
  end

end
