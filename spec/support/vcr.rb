VCR.configure do |c|
  c.cassette_library_dir     = Rails.root.join("/tmp", Rails.application.class.to_s.underscore, "vcr-cassettes", "specs")
  c.hook_into                :webmock
  c.default_cassette_options = { :record => :new_episodes }
  c.allow_http_connections_when_no_cassette = false
end

Rspec.configure do |config|
  # Add VCR to all tests
  config.around(:each) do |example|
    options = example.metadata[:vcr] || {}
    options = {} if options == true
    if options[:record] == :skip
      VCR.turned_off(&example)
    else
      name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
      VCR.use_cassette(name, options, &example)
    end
  end
end
