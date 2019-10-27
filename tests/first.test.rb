require './lib/ruby_tdd'

test_case('smoke test', Proc.new {
  1 == 1
})

test_case('raises error', Proc.new {
  raise 'ERROR!'
})