class LanguagesController < ApplicationController
  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new language_params
    if @language.save
      redirect_to language_slides_path(@language), notice: 'New Language Created'
    else
      flash[:alert] = @language.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @language = Language.find_by_name params[:id]
  end

  def update
    @language = Language.find_by_name params[:id]
    if @language.update language_params
      redirect_to language_slides_path(@language), notice: 'Language Updated'
    else
      flash[:alert] = @language.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def language_params
    params.require(:language).permit(:name, :iso_639_1)
  end
end
