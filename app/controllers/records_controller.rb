class RecordsController < ApplicationController
  def index
    @years = Record.group(:year).distinct.count(:year)
    @genres = Record.group(:genre).distinct.count(:genre)
    @artists = Record.group(:artist).distinct.count(:artist)

    render json: { records: Record.all, years: @years, genres: @genres, artists: @artists }
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      render json: { status: :created, record: @record }
    else
      render json: { errors: @record.errors.full_messages }, status: :internal_server_error
    end
  end

  def destroy
    Record.delete_by(id: params[:id])
    render json: { status: :ok }
  end

  private

  def record_params
    params.require(:record).permit(:title, :artist, :year, :genre, :image_data)
  end
end
