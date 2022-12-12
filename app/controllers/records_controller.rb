class RecordsController < ApplicationController
  def index
    @years = Record.group(:year).count(:year)
    @genres = Record.group(:genre).count(:genre)
    @artists = Record.group(:artist).count(:artist)

    render json: { records: Record.all, stats: {year: @years, genre: @genres, artist: @artists} }
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
