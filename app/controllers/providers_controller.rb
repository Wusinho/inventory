class ProvidersController < ApplicationController
  before_action :set_provider, only: [:edit, :update]
  def index
    @provider = Provider.new
    @providers = Provider.all
  end

  def edit;end

  def update
    if @provider.update(providers_params)
      redirect_to providers_path
    end
  end

  def create
    @provider = provider.new(providers_params)

    if @provider.save

    end

  end



  def set_provider
    @provider = Provider.find(params[:id])
  end

  def providers_params
    params.require(:provider).permit(:name)
  end
end
