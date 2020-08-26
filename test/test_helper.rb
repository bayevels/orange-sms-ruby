require 'simplecov'
require 'simplecov_small_badge'
SimpleCov.start do
  # add your normal SimpleCov configs
  add_filter "/app/model"
  # call SimpleCov::Formatter::BadgeFormatter after the normal HTMLFormatter
  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCovSmallBadge::Formatter
  ])
end

# configure any options you want for SimpleCov::Formatter::BadgeFormatter
SimpleCovSmallBadge.configure do |config|
  # does not created rounded borders
  config.rounded_border = true
  # set the background for the title to darkgrey
  config.background = '#ffffcc'
end

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'orange_sms'

require 'minitest/autorun'
require 'webmock/test_unit'
