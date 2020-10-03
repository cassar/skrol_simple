class SlidesController < ApplicationController
  def index
    @slides = Slide.all.order(:id)
  end

  def show
    @slide = Slide.find params[:id]
    Slide.count
    @next_slide_id = next_slide_id
  end

  def new
    @slide = Slide.new
  end

  def create
    Slide.create slide_params
    redirect_to new_slide_path
  end

  private

  def slide_params
    params.require(:slide).permit(:maltese_ipa, :maltese_latin, :english_latin)
  end

  def next_slide_id
    incremented = @slide.id + 1
    return incremented if incremented <= Slide.count

    1
  end
end
