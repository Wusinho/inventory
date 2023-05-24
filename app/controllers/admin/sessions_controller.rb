# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  include Requestable
  # before_action :configure_sign_in_params, only: [:create]
  before_action :get_phrase, only: [:new]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def get_phrase
    phrase = inspiration_phrase
    @phrase = phrase[0]
    @author = phrase[1]
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
