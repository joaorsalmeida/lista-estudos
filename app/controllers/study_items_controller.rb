class StudyItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def new
  end

  def create
    StudyItem.create(params.require(:study_item).permit(:title, :description, :done))
    redirect_to root_path
  end

 
end