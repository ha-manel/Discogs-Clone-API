require 'faker'

(1..20).each do |id|
  Record.create!(
    id: id,
    title: Faker::Music.album,
    artist: Faker::Music.band,
    year: Faker::Number.between(from: 1970, to: 2022),
    genre: Faker::Music.genre
  )
end
