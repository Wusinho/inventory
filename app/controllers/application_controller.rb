class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::NotNullViolation, with: :handle_not_null_violation

  def current_balance
    @current_balance ||= Balance.last_created
  end

  def selected_params
    @selected_params = params.slice(:sort_by_name, :categories, :paid_orders, :unpaid_orders, :users)
  end

  def turbo_error_message(instance)
    render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                              locals: { message: instance.errors.full_messages.to_sentence })
  end

  def active_record_error_message(message)
    render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                              locals: { message: message})
  end


  def handle_not_null_violation(exception)
    render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                              locals: { message: exception.message})
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  end
end
