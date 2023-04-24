class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def turbo_error_message(instance)
    render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                              locals: { message: instance.errors.full_messages.to_sentence })
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  end
end
