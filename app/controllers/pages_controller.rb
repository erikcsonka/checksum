class PagesController < ApplicationController

  def calculate
    @result = params[:text].present? ? 'test' : 'empty_error'
    respond_to do |format|
      format.js
    end
  end  
end