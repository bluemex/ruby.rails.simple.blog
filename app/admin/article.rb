ActiveAdmin.register Article do

permit_params :title, :content

  index do
    selectable_column
    id_column
    column :title
    column :content
    column :user_id
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :content
  filter :user_id
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "article Details" do
      f.input :title
      f.input :content
    end
    f.actions
  end


end
