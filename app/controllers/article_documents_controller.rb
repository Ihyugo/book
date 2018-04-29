class ArticleDocumentsController < ApplicationController
  def index
	  if params[:root].nil?
	  @index = "there are no index"
	  content = []
	  f = File.open('file/sample.odt','r')
	  f.each do |text|
		  content.push(text)
	  end
	  f.close()
	  document = content.join
	  @content = document
	  else
	  url = "https://www.sciencenews.org/" + params[:root]
	  agent = Mechanize.new
	  page= agent.get(url)
	  page = page.search('//span[@itemprop="description"]')
	  documents = page.search('p')
	  contents = []
	  documents.each do |document|
		  contents.push(document)
		  contents.push("\n\n")
	  end
	  contents = contents.join
	  file_name = "file/"+ params[:title]+".odt"
	  f = File.open(file_name,'w')
	  f.puts(contents)
	  f.close()
	  @content = contents
	  end
  end
end
