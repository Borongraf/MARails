ActiveAdmin.register User do
  # Permit the necessary parameters
  permit_params :email, :password, :password_confirmation, :reset_password_token, :reset_password_sent_at, :remember_created_at

  # Customize the form
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    actions
  end

  filter :email
  filter :created_at
  filter :updated_at
end
