# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def uploads
    return unless params[:uploaded_file_list]

    @basket = ProductListFileHandler.parse_and_return_basket(params[:uploaded_file_list])
    render :home
  end
end
