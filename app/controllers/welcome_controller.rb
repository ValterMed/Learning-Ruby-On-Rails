class WelcomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def contact
    @name = "walter"
    @email = "waltermedinapuy@live.com"
  end
end
