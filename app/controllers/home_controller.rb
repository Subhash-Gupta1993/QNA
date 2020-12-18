class HomeController < ApplicationController
  def index
  	@questions = Question.all.recent
  end
end
