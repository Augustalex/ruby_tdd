require 'listen'

class TestWatch
  def initialize(relative_path, test_block)
    @relative_path = relative_path
    @test_block = test_block

    start
  end

  private

  def start
    run
    listener.start
    sleep
  end

  def listener
    Listen.to(absolute_path) do
      run
    end
  end

  def absolute_path
    File.expand_path(@relative_path)
  end

  def run
    system "clear" or system "cls"
    puts Time.new.inspect
    @test_block.call
  end
end