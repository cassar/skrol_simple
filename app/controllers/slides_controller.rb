class SlidesController < ApplicationController
  def index
    @slides = Slide.all.order(:id)
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
    Slide.create slide_params
    redirect_to new_slide_path, notice: 'New Slide Created'
  end

  private

  def slide_params
    params.require(:slide).permit(:maltese_ipa, :maltese_latin, :english_latin)
  end

  def next_slide_id
    incremented = @slide.id + 1
    return incremented if incremented <= Slide.last.id

    Slide.first.id
  end

  def previous_slide_id
    decremented = @slide.id - 1
    return decremented if decremented >= Slide.first.id

    Slide.last.id
  end
end
