class ArticleDocumentsController < ApplicationController
  def index
	  if params[:name].nil?
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
	  url = "https://www.sciencenews.org/" + params[:name]
	  agent = Mechanize.new
	  page= agent.get(url)
	  page = page.search('//span[@itemprop="description"]')
	  documents = page.search('p')
	  contents = []
	  translation = "https://translate.google.co.jp/?hl=ja&tab=wT&authuser=0#en/ja/"
	  documents.each do |document|
		  contents.push(document)
		  contents.push("\n\n")
	  end
	  contents = contents.join
	  puts contents
	  file_name = "file/"+ params[:title]+".odt"
	  f = File.open(file_name,'w')
	  f.puts(contents)
	  f.close()
	  @content = contents
	  end
  end
end
