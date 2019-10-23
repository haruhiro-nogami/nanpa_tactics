class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :age
      t.integer :height
      t.string :body_shape
      t.string :looks_type
      t.string :nanpa_style
      t.string :prefecture
      t.string :place
      t.string :time
      t.string :wheather
      t.text :description

      t.timestamps
    end
  end
end
