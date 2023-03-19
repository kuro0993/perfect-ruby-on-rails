class BooksController < ApplicationController
  protect_from_forgery except: [:destroy] # CSRF対策をOFF
  before_action :set_book, only: [:show, :destroy]
  around_action :action_logger, only: [:destroy]

  def show
    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def around_action
    logger.info "arround-before"
    yield
    logger.info "arround-after"
  end
end
