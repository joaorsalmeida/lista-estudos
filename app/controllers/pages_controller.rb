class PagesController < ApplicationController
  def home
    @study_items = StudyItem.all
  end
end