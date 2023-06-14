# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  include Requestable
  # before_action :configure_sign_in_params, only: [:create]
  before_action :get_phrase, only: [:new]
  after_action :create_balance, only: [:create]

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    store_location_for(resource, params[:redirect_to])

    respond_with(resource, serialize_options(resource))
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
    return if current_balance.last_day.strftime("%Y-%b") == Date.current.strftime("%Y-%b")

    @current_balance = Balance.create(starting_total: current_balance.sub_total)
  end
end
