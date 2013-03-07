class StaticPagesController < ApplicationController
  def about
  end

  def home
  end

  def search
    @pg_search_documents = PgSearch.multisearch( params[:q] )


  end
end
