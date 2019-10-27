require "ruby_tdd/version"
require 'colorize'
require_relative './test_watch'
require_relative './stub'

def test_case(description, block)
  begin
    if block.call
      test_passed_message 'Passed: "' + description + '"'
    else
      test_failed_message 'Failed test: "' + description + '"'
    end
  rescue => error
    test_failed_message 'Failed test because an error was raised: ' + error.to_s
  end
end

def test_passed_message(text)
  puts text.green
end

def test_failed_message(text)
  puts text.red
end