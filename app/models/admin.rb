class Admin < ApplicationRecord
  include Editable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:admin, :super_admin ]

  self.roles.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end

  def providers_select
    Provider.pluck(:name, :id)
  end
end
