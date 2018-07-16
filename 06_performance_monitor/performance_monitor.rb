def measure(count=1, &block)
  durations = 0
  count.times do
    start_time = Time.now
    yield
    end_time = Time.now
    durations += end_time - start_time
  end
  durations/ count
end
