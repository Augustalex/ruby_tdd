require "ruby_tdd/version"
require 'colorize'
require '../lib/test_watch'
require '../lib/stub'

module RubyTdd
  def assert(message = '', expression = false)
    unless expression
      puts "Assertion error: " + message
    end
  end

  def test(description, block)
    if block.call
      passed 'Passed: "' + description + '"'
    else
      failed 'Failed test: "' + description + '"'
    end
  end

  def passed(text)
    puts text.green
  end

  def failed(text)
    puts text.red
  end
end