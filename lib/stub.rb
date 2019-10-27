class Stub
  def initialize
    @called = Hash.new
  end

  def method_missing(m)
    @called["#{m}"] = "#{m}"
  end

  def called? (method)
    @called.has_key? method
  end
end