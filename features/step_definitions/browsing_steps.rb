Given /^the following artist records$/ do |table|
  table.hashes.each do |hash|
    Artist.new(hash).save!
  end
end

Given /^the following album records$/ do |table|
  table.hashes.each do |hash|
    Album.new(hash).save!
  end
end

Given /^the following track records$/ do |table|
  table.hashes.each do |hash|
    Track.new(hash).save!
  end
end

Then /^I should see an? (\w.+) table$/ do |model, table|
  table.diff!(tableish("table##{model} tbody tr", 'td'))
end

Then /^I should see the cover image$/ do
  page.should have_xpath('//img[@class="album_cover"]')
end
