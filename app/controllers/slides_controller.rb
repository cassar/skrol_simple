class SlidesController < ApplicationController
  before_action :language

  def index
    @slides = @language.slides.order(:id)
  end

  def show
    @slide = Slide.find params[:id]
    Slide.count
    @next_slide_id = next_slide_id
    @previous_slide_id = previous_slide_id
  end

  def new
    @slide = Slide.new
    @slides = Slide.order(:id).reverse
  end

  def create
    @language.slides.create slide_params
    redirect_to new_language_slide_path(@language), notice: 'New Slide Created'
  end

  def edit
    @slide = Slide.find params[:id]
  end

  def update
    @slide = Slide.find params[:id]
    @slide.update slide_params
    redirect_to language_slide_path(@language, @slide), notice: 'Slide updated'
  end

  private

  def language
    @language = Language.find_by_name params[:language_id]
  end

  def slide_params
    params.require(:slide).permit(:target_ipa, :target_script, :english_latin)
  end

  def next_slide_id
    incremented = @slide.id + 1
    return incremented if incremented <= language.slides.last.id

    @language.slides.first.id
  end

  def previous_slide_id
    decremented = @slide.id - 1
    return decremented if decremented >= @language.slides.first.id

    @language.slides.last.id
  end
end
