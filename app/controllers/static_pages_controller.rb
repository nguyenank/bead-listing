class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def searchexplain
    respond_to do |format|
     format.html
     format.js
   end
  end

end
