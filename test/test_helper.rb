$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "omniauth-centralid"

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)
