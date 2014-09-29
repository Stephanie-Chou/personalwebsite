class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :date
      t.text :title
      t.string :language
      t.string :runtime
      t.text :code
      t.text :problem
      t.text :content

      t.timestamps
    end
  end
end
