class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update]
    #Create
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Assign App #{@user.username}, you have successfully signed up!"
            session[:user_id] = @user.id
            redirect_to articles_path
        else
            render 'new'
        end
    end

    #Read
    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    #Update
    def edit
    end
    
    def update
        if @user.update(user_params)
            flash[:notice] = "#{@user.username} profile updated successfully."
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    def require_same_user
        if current_user != @user
            flash[:alert] = "You can make changes to your account only"
            redirect_to user_path(@user)
        end
    end
end