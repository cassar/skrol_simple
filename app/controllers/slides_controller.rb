class SlidesController < ApplicationController
  include StudentManager

  before_action :language

  after_action :record_visit, only: :show, if: -> { current_student.present? }

  def index
    @slides = @language.slides.order(:id)
  end

  def current
    if current_slide
      redirect_to language_slide_path @language, current_slide
    else
      redirect_to language_slides_path @language
    end
  end

  def show
    @slide = Slide.find params[:id]
    @next_slide_id = next_slide_id
    @previous_slide_id = previous_slide_id
  end

  def new
    @slide = Slide.new
    @slides = @language.slides.order(:id).reverse.take(10)
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

  def slide_ids
    @slide_ids ||= @language.slides.order(:id).pluck(:id)
  end

  def next_slide_id
    current_index = slide_ids.index @slide.id
    incremented = slide_ids[current_index + 1]
    return incremented if incremented.present?

    slide_ids.first
  end

  def previous_slide_id
    slide_ids[(slide_ids.index @slide.id) - 1]
  end

  def record_visit
    current_student.visits.create slide: @slide
  end

  def current_slide
    @current_slide_id ||= begin
      current_slide = if current_student.present?
        current_student
          .visited_slides
          .where(language: @language)
          .first
      end
      current_slide ||= @language.slides.first
    end
  end
end
