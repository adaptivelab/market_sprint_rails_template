ActiveAdmin.register Page do

  permit_params :slug, :title, :image_url, :next_url, :layout

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
    f.inputs "Required" do
      f.input :slug, hint: "Used as permalink to the url, e.g. 'step-3' can then be accessed at '/pages/step-3'"
      f.input :image_url, as: :string
      f.input :next_url, as: :string
    end

    f.inputs "Optional" do
      f.input :title, hint: "If unspecified, it will be a titlized version of the slug"
      f.input :layout, hint: "E.g. 'empty'"
    end

    f.actions
  end

  controller do
    def resource
      params[:id] ? Page.find_by(slug: params[:id]) || raise(ActiveRecord::RecordNotFound, "No Page found with slug '#{params[:id]}'") : Page.new
    end
  end

  show do
    div do
      a(href: resource.next_url) do
        img(src: resource.image_url, alt: "Click to test url")
      end
    end
  end

end
