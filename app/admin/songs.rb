ActiveAdmin.register Song do
  # Permit the necessary parameters
  permit_params :title, :description, :user_id, :published, :profile_image, :audio, all_tags: []

  # Customize the index page
  index do
    selectable_column
    id_column
    column :title
    column :description
    column :user
    column :published
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :user
      f.input :published
      f.input :profile_image, as: :file
      f.input :audio, as: :file
      f.input :all_tags, as: :string
    end
    f.actions
  end

  filter :title
  filter :description
  filter :user
  filter :published
  filter :created_at
  filter :updated_at
end
