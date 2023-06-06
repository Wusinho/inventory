module Crudatable
  extend ActiveSupport::Concern

  included do
    before_action :set_resource, only: [:show, :edit]

    def index
      @resources = resource_class.all
      @model = resource_class.to_s.downcase
    end

    def show;end

    def edit;end

    def new
      @resource = resource_class.new
    end

    def create
      @resource = resource_class.new(resource_params)
      if @resource.save
        redirect_to send("admin_#{resource_name}_path"), notice: "#{resource_name.capitalize} was successfully created."
      else
        render :new
      end
    end

    def edit
      @resource = resource_class.find(params[:id])
    end

    def update
      @resource = resource_class.find(params[:id])
      if @resource.update(resource_params)
        redirect_to send("admin_#{resource_name}_path"), notice: "#{resource_name.capitalize} was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @resource = resource_class.find(params[:id])
      @resource.destroy
      redirect_to send("admin_#{resource_name}_path"), notice: "#{resource_name.capitalize} was successfully destroyed."
    end

    private

    def set_resource
      @resource = resource_class.find(params[:id])
    end

    def resource_params
      params.require(resource_name.to_sym).permit(:name, :description, :price)
    end

    def resource_class
      resource_name.classify.split('::').last.constantize
    end

    def resource_name
      self.class.name.gsub(/Controller$/, "").underscore
    end
  end
end
