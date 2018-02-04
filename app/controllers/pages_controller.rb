class PagesController < ApplicationController

  def calculate
    @result = params[:text].present? ? Calculator.new(params[:text]).run : 'empty_error'
    respond_to do |format|
      format.js
    end
  end  
end