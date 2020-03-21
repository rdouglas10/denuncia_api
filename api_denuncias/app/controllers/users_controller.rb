class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { error: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  # def update
  #   if @users.find_user(params[:token_access])
  #     if @user.update(user_params)
  #       render json: @user, status: :ok
  #     else
  #       render json: { errors: @user.errors.full_messages },
  #             status: :unprocessable_entity
  #     end
  #   else
  #     render json: {errors: @user.errors.full_messages},status: :unprocessable_entity
  #   end
  # end

  def update
    
    user = User.where("token_access=?",params[:token_access])
    if user
      if user.update(user_params)
        render json: {status: 'SUCCESS', message:'Usuário atualizado!', data:user},status: :ok
      else
        render json: { error: user.errors.full_messages },
        status: :unprocessable_entity
      end
    else
      render json: { error: user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Usuário não encontrado.' }, status: :not_found
  end

  def user_params
    params.permit(
      :name, :username, :email, :password, :password_confirmation, :token_access
    )
  end
end