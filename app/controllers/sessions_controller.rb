class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by(name: params[:user][:name])

        if user && user.authenticate(params[:user][:password]) 
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = "Password or Username incorrect"
            redirect_to new_session_path 
        end 

    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

end