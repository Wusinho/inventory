class ProvidersController < ApplicationController
  before_action :set_provider, only: [:edit, :update]
  def index
    @provider = Provider.new
    @providers = Provider.all
  end

  def edit;end

  def update
    if @provider.update(providers_params)
      render turbo_stream: turbo_stream.replace("provider_#{@provider.id}", partial: 'providers/provider', locals: { provider: @provider })
    end
  end

  def create
    @provider = Provider.new(providers_params)

    if @provider.save
      streams = []
      streams << turbo_stream.append('providers', partial: 'providers/provider', locals: { provider: @provider })
      streams << turbo_stream.replace('provider_form', partial: 'providers/form', locals: { provider: Provider.new })
      render turbo_stream: streams
    else
      turbo_error_message(@provider)
    end

  end



  def set_provider
    @provider = Provider.find(params[:id])
  end

  def providers_params
    params.require(:provider).permit(:name, :phone)
  end
end
