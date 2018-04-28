class ArticleDocumentsController < ApplicationController
  def index
	  @index = "there are no index"
	  content = []
	  f = File.open('file/sample.odt', 'r') # wは書き込み権限
	  f.each do |text|
		  content.push(text)
	  end
	  f.close()
	  document = content.join
	  @content = document
	  puts @content
  end
end
