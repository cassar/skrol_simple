class DeleteSlides < ActiveRecord::Migration[6.0]
  def change
    Slide.destroy_all
  end
end
