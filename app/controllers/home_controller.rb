class HomeController < ApplicationController
  def index #nome do arquivo dentro de view/home/
    @kids = Kind.all
  end
end
