module Crudatable
  extend ActiveSupport::Concern

  included do
    before_action :set_resource, only: [:show, :edit, :update, :destroy]

    def index
      @resources = resource_class.all
      @model = resource_class.to_s.downcase
    end

    def show;end

    def new
      @resource = resource_class.new
    end

    def create
      @resource = resource_class.new(resource_params)
      if @resource.save
        redirect_to root_path
      else
        turbo_error_message(@resource)
      end
    end

    def edit
    end

    def update
      if @resource.update(resource_params)
        redirect_to root_path
      else
        turbo_error_message(@resource)
      end
    end

    def destroy
      @resource.destroy
      redirect_to root_path
    end

    private

    def set_resource
      @resource = resource_class.find(params[:id])
    end

    def resource_class
      resource_name.classify.split('::').last.constantize
    end

    def resource_name
      self.class.name.gsub(/Controller$/, "").underscore
    end
  end
end
