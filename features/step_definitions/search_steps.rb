Before('@no-txn') do
  DatabaseCleaner.start
end

After('@no-txn') do
  DatabaseCleaner.clean
end

# http://freelancing-god.github.com/ts/en/testing.html
Given 'the Sphinx indexes are updated' do
  # Update all indexes
  ThinkingSphinx::Test.index
  sleep(0.25) # Wait for Sphinx to catch up
end