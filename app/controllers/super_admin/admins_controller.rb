# frozen_string_literal: true

class SuperAdmin::AdminsController < ApplicationController
  before_action :authenticate_admin!

  include Crudatable
end
