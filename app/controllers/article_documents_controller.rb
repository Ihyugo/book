class ArticleDocumentsController < ApplicationController
  def index
	  if params[:root].nil?
	  @index = "there are no index"
	  if @content.nil?
		  @content_name = ArticleFile.last.title
		  @content = ArticleFile.last.text
	  end
	  else
	  url = "https://www.sciencenews.org/" + params[:root]
	  documents = make_text(url)
	  contents = []
	  documents.each do |document|
		  contents.push(document)
		  contents.push("\n\n")
	  end
	  contents = contents.join
	  if ArticleFile.find_by(title: params[:title]).nil?
		  save_text(contents)
	  end
	  @content_name = params[:title]
	  @content = contents
	  end
  end

  def make_text(url)
	  agent = Mechanize.new
	  page= agent.get(url)
	  page = page.search('//span[@itemprop="description"]')
	  documents = page.search('p')
	  return documents
  end

  def save_text(contents)
	  @newfile = ArticleFile.new
	  @newfile.title = params[:title]
	  @newfile.text = contents
	  @newfile.save
  end
end
