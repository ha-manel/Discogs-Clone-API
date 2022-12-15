require 'rails_helper'

RSpec.describe Record, type: :model do
  before :all do
    @record = Record.create(title: 'test', artist: 'test', year: 2022, genre: 'test')
  end

  it 'is valid' do
    expect(@record).to be_valid
  end

  it 'title should be present' do
    @record.title = nil
    expect(@record).to_not be_valid
  end

  it 'artist should be present' do
    @record.artist = nil
    expect(@record).to_not be_valid
  end

  it 'year should be present' do
    @record.year = nil
    expect(@record).to_not be_valid
  end

  it 'genre should be present' do
    @record.genre = nil
    expect(@record).to_not be_valid
  end
end
