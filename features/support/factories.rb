Factory.define :artist do |f|
  f.name "Artist"
end

Factory.define :album do |f|
  f.title "Album"
  f.artist
end

Factory.define :track do |f|
  f.title "Track"
  f.album
end