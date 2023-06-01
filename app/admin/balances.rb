ActiveAdmin.register Balance do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :starting_total, :sub_total, :last_day, :created_at, :updated_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:starting_total, :sub_total, :last_day]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :starting_total
      f.input :sub_total
      f.input :last_day
      f.input :created_at
      f.input :updated_at
    end
    f.actions
  end
end
