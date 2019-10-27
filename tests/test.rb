require './lib/ruby_tdd'

TestWatch.new('./lib', Proc.new {
  test_case('smoke test', Proc.new {
    1 == 1
  })
})