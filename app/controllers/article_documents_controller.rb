class ArticleDocumentsController < ApplicationController
  def _left
	  @index = "no file"
  end

  def main
	  @documents = "this is first documents"
  end

  def top
	  @titles = "there are nothing"
  end
end
