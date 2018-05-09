class ArticleDocumentsController < ApplicationController
  def index
	  if !params[:download].nil?
		  download
	  end
	  if params[:root].nil?
	  @index = "there are no index"
	  if @content.nil?
		  @content_name = ArticleFile.last.title
		  @content = ArticleFile.last.text
		  @url = ArticleFile.last.url
	  end
	  else
	  url = "https://www.sciencenews.org/" + params[:root]
	  @url = url
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
	  @newfile.url = @url
	  @newfile.save
  end
 
  def download
	  content_name = ArticleFile.last.title + ".odt"
	  content = ArticleFile.last.text
	  url = ArticleFile.last.url
	  file_root = "file/" + content_name
	  file = File.open(file_root, "w")
	  file.puts(content)
	  file.puts("\n\n\n")
	  file.puts(url)
	  file.close
	  send_file(file_root, :filename => content_name )
  end
end
