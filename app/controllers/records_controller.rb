class RecordsController < ApplicationController
  def index
    @years = Record.group(:year).count(:year)
    @genres = Record.group(:genre).count(:genre)
    @artists = Record.group(:artist).count(:artist)

    @records = Record.all.with_attached_image_data

    render json: {
      records: @records.map { |record| record.as_json.merge({ image_data: url_for(record.image_data) }) },
      stats: { year: @years, genre: @genres, artist: @artists }
    }, stats: :ok
  end

  def create
    if params[:image_data] == 'null'
      @record = Record.new
      @record.title = params[:title]
      @record.artist = params[:artist]
      @record.year = params[:year]
      @record.genre = params[:genre]
      @record.image_data.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.png')),
                                filename: 'default.png', content_type: 'image/png')
    else
      @record = Record.new(record_params)
    end
    if @record.save
      render json: { status: :created, record: @record.as_json.merge({ image_data: url_for(@record.image_data) }) }, status: :created
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
    params.permit(:title, :artist, :year, :genre, :image_data)
  end
end
