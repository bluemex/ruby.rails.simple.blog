ActiveAdmin.register Comment, as:"ArticleComment" do

permit_params :name, :comment

  index do
    selectable_column
    id_column
    column :name
    column :comment
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :comment
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "article Details" do
      f.input :name
      f.input :comment
    end
    f.actions
  end

end
