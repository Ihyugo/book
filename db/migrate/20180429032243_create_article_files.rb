class CreateArticleFiles < ActiveRecord::Migration
  def change
    create_table :article_files do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
