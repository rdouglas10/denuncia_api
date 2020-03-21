class PasswordsController < ApplicationController

  # POST /passwords/forgot
  def forgot
    if params[:email].blank? # verifica se o email foi informado
      return render json: {error: 'Email não informado'}
    end

    @user = User.find_by_email(params[:email]) # busca o usuário a quem o email pertence

    if @user.present?
      @user.generate_password_token! # gera um token
      # SEND EMAIL HERE
      render json: {token: @user.reset_password_token,}, status: :ok
    else
      render json: {error:'Email não encontrado. Por favor, verifique e tente novamente.'}, status: :not_found
    end
  end

  # POST /passwords/reset
  def reset
    token = params[:token].to_s

    if params[:email].blank?
      return render json: {error: 'Não há token...'}
    end

    @user = User.find_by_reset_password_token(params[:token])

    if @user.present? && @user.password_token_valid?
      if @user.reset_password!(params[:password])
        render json: {status: 'ok'}, status: :ok
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error:'Link inválido ou expirado. Tente gerar um novo link.'}, status: :not_found
    end
  end

end
