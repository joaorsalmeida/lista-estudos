class StudyItemsController < ApplicationController
  def new
  end

  def create
    StudyItem.create(params.require(:study_item).permit(:title, :description, :done))
    redirect_to root_path
  end
end