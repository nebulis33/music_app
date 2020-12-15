# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users
4.times do
    User.create(email: Faker::Internet.unique.email, name: Faker::Name.name, password: 'foobar')
end

# Bands
2.times do
    Band.create(name: Faker::Music.unique.band)
end

# Albums
2.times do
    Album.create(title: Faker::Music.unique.album, year: 1975, band_id: 1)
end

2.times do
    Album.create(title: Faker::Music.unique.album, recording_type: 'live', year: 1960, band_id: 2)
end

# Tracks
for i in (1..4) do
    Track.create(title: Faker::Music::GratefulDead.unique.song, ord: i, album_id: 1, lyrics: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
end
for i in (5..8) do
    Track.create(title: Faker::Music::GratefulDead.unique.song, ord: i, regular: false, album_id: 1)
end

for i in (1..4) do
    Track.create(title: Faker::Music::GratefulDead.unique.song, ord: i, album_id: 4)
end
for i in (5..8) do
    Track.create(title: Faker::Music::GratefulDead.unique.song, ord: i, regular: false, album_id: 4)
end

# Notes
Note.create(user_id: 1, track_id: 1, body: "Lorem ipsum notes.")