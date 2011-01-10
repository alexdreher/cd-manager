Given /^the following (\w.+) records$/ do |model, table|  
  table.hashes.each do |hash|
    Factory(model, hash)
  end
end

Then /^I should see an? (\w.+) table$/ do |model, table|
  table.diff!(tableish("table##{model} tbody tr", 'td'))
end

Then /^I should see the cover image$/ do
  page.should have_xpath('//img[@class="album_cover"]')
end
