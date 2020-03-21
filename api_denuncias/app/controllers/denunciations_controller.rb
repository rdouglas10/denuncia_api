class DenunciationsController < ApplicationController
  before_action :authorize_request #, except: :create

# GET /denunciations
def index
  @denuncia = Denunciation.all
  render json: @denuncia, status: :ok
end

# GET /denunciations/{id}
def show
  render json: @denuncia, status: :ok
end

# POST /denunciations
def create
  @user = User.where("token_access=?",params[:token_access_user])
  
  if @user.present?
    # @denuncia = Denunciation.new(denunciation_params)
    @denuncia = Denunciation.new
    @denuncia[:descricao] = params[:descricao]
    @denuncia[:status] = params[:status]
    @denuncia[:latitude] = params[:latitude]
    @denuncia[:longitude] = params[:longitude]
    @denuncia[:medida_adotada] = params[:medida_adotada]
    @denuncia[:user_id] = @user[0]["id"]
    
    if @denuncia.save
      # @denuncia.update(user_id:user)
      render json: @denuncia, status: :created
    else
      render json: { error: @denuncia.errors.full_messages },
            status: :unprocessable_entity
    end
  else
    render json: { errors: 'Usuário não encontrado' }, status: :not_found
  end
end

# PUT /denunciations/{id}
def update
  @denuncia = Denunciation.find_by_id(params[:id])
  if @denuncia.update(denunciation_params)
    render json: {status: 'SUCCESS', message:'Denúncia atualizada!', data:denuncia},status: :ok
  else
    render json: {status: 'ERROR', message:'Erro ao atualizar a denúncia...', data:denuncia.erros},status: :unprocessable_entity
  end
end

# DELETE /denunciations/{id}
def destroy
  @user.destroy
end

private

def find_denunciation
  @user = Denunciation.find_by_id!(params[:_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Denúncia não encontrada.' }, status: :not_found
end

def denunciation_params
  params.permit(
   :descricao, :status, :latitude, :longitude, :medida_adotada, :user_id
  )
end


end
