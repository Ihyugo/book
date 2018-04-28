class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index 
	  agent = Mechanize.new
	  page = agent.get("https://www.sciencenews.org/")
	  elements = pages.search('//h2[@class="node-title"]')
	  contents = []
	  elements.each do |ele|
		  methods = []
		  methods.push(ele.push('a').get_attrubute('title'))
		  methods.push(ele.push('a').get_attrubute('href'))
		  contents.push(methods)
	  end
	  @title = contents

			       
  end
end
