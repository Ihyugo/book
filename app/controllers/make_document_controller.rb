class MakeDocumentController < ApplicationController
  def index
	  agent = Mechanize.new
	  page = agent.get("https://www.sciencenews.org/")
	  elements = page.search('//h2[@class="node-title"]')
	  el = page.search(".node-title")
	  contents = []
	  elements.each do |ele|
		  methods = []
		  methods.push(ele.at('a').get_attribute('title'))
		  methods.push(ele.at('a').get_attribute('href'))
		  contents.push(methods)
	  end
	  @title = contents
  end

  def main
	  url ="https://www.sciencenews.org/"
  end
end
