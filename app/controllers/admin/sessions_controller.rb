# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  include Requestable
  # before_action :configure_sign_in_params, only: [:create]
  before_action :get_phrase, only: [:new]
  before_action :create_balance, only: [:new]

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
    @phrase = inspiration_phrase
  end

  def create_balance
    return if current_balance.created_at.strftime("%Y-%b") == Date.current.strftime("%Y-%b")

    Balance.create(starting_total: current_balance.sub_total)
  end
end
