class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :slug
      t.string :title
      t.text :next_url
      t.text :image_url
      t.string :layout

      t.timestamps
    end
  end
end
