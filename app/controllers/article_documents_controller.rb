class ArticleDocumentsController < ApplicationController
  def index
	  @index = "there are no index"
	  content = []
	  f = File.open('file/sample.odt','r')
	  f.each do |text|
		  content.push(text)
	  end
	  f.close()
	  document = content.join
	  @content = document
  end
end
