require 'rbconfig'
require 'listen'

THIS_FILE = File.expand_path(__FILE__)
RUBY = File.join(RbConfig::CONFIG['bindir'], RbConfig::CONFIG['ruby_install_name'])

class TestWatch
  def initialize(listen_to_relative_path, test_relative_path)
    @listen_to_relative_path = listen_to_relative_path
    @test_relative_path = test_relative_path
    start
  end

  private

  def start
    run
    listener.start
    sleep
  end

  def listener
    Listen.to(absolute_relative_path) do
      run
    end
  end

  def absolute_relative_path
    File.expand_path(@listen_to_relative_path)
  end

  def absolute_test_path
    File.expand_path(@test_relative_path)
  end

  def run
    system "clear" or system "cls"
    puts test_runner_header + current_time
    puts
    put_lines from_test_output
  end

  def test_paths
    Dir["#{absolute_test_path}/**/*.test.rb"]
  end

  def current_time
    Time.new.inspect
  end

  def from_test_output
    test_paths
        .map { |path| "#{test_header_for path}:\n#{`#{RUBY} #{path}`}\n" }
        .join ""
  end

  def test_header_for(path)
    path.split('/').last.split('.').first.capitalize
  end

  def test_runner_header
    "Running tests: "
  end

  def put_lines(text_with_lines)
    lines = text_with_lines.split("\n")
    lines.each do |line|
      puts "#{line}"
    end
  end
end