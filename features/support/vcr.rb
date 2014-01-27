VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join("features", "cassettes")
  c.hook_into :webmock
  c.ignore_localhost = true
end

VCR.cucumber_tags do |t|
  t.tag "@vcr", use_scenario_name: true, allow_playback_repeats: true
end
