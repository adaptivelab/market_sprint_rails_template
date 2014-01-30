class Page < ActiveRecord::Base

  def to_param
    slug
  end

  def title
    t = read_attribute(:title)
    t.blank? ? slug_as_title : t
  end

  protected
  def slug_as_title
    slug.blank? ? "" : slug.titleize
  end

end
