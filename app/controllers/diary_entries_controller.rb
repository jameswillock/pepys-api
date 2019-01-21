class DiaryEntriesController < ApplicationController
  def index
    @diary_entries = DiaryEntry.all
    render json: @diary_entries
  end

  def show
    @diary_entry = DiaryEntry.find(params[:id])
    render json: @diary_entry
  end
end
