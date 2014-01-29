class PagesController < ApplicationController

  layout :layout

  def show
    @page = Page.find_by(slug: params[:id])
    render :show, layout: layout
  end

  protected
  def layout
    @page.layout.blank? ? "application" : @page.layout
  end

end
