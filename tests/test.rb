require './lib/ruby_tdd'

TestWatch.new('./lib', Proc.new {
  test_case('smoke test', Proc.new {
    1 == 1
  })

  test_case('equal?', Proc.new {
    equal? 1, 1
  })
})