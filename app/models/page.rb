class Page < ActiveRecord::Base

  def to_param
    slug
  end

  def title
    t = read_attribute(:title)
    t.blank? ? slug.titleize : t
  end

end
