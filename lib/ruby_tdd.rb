require "ruby_tdd/version"
require 'colorize'
require_relative './test_watch'
require_relative './stub'

class RubyTdd
  def self.assert(message = '', expression = false)
    unless expression
      puts "Assertion error: " + message
    end
  end

  def self.test(description, block)
    if block.call
      passed 'Passed: "' + description + '"'
    else
      failed 'Failed test: "' + description + '"'
    end
  end

  private

  def self.passed(text)
    puts text.green
  end

  def self.failed(text)
    puts text.red
  end
end