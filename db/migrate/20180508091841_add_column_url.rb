class AddColumnUrl < ActiveRecord::Migration
  def change
	  add_column :article_files, :url, :text
  end
end
