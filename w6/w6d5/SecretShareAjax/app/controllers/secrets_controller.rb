class SecretsController < ApplicationController
  def new
    @secret = Secret.new
  end

  def index
  end

  def create
    @secret = Secret.new(secret_params)
    @secret.tags.new(params[:name])
    if @secret.save
      redirect_to :back
    else
      flash.now[:errors] = @secret.errors.full_messages
      render :new
    end
  end

  private

  def secret_params
    params.require(:secret).permit(:title, :author_id, :recipient_id)
  end
end
