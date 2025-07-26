# frozen_string_literal: true

# A simple Rack application that performs a CPU-bound Fibonacci calculation
# designed to take approximately 1 second and returns "ok"

TARGET_TIME = 0.1

class FibonacciApp
  # def initialize
  #   # Find the correct N value once during boot time
  #   @n, elapsed, _ = find_fibonacci_target(TARGET_TIME)
  #   puts "Found optimal N=#{@n} in #{elapsed.round(2)}s (target: #{TARGET_TIME}s)"
  # end

  def call(env)
    now = Time.now
    # calculate_fibonacci(@n)
    sleep 0.1
    elapsed = Time.now - now

    output = "200 - USE_THRUSTER=#{ENV["USE_THRUSTER"]} PUMA_KEEP_ALIVE=#{ENV["PUMA_KEEP_ALIVE"]} PUMA_THREADS=#{ENV["PUMA_THREADS"]} ELAPSED=#{elapsed.round(2)}"
    output += "\n" * 5
    output += "a" * 100 * 1024 # 100 KB

    puts "Request took #{elapsed.round(2)}s"
    [200, { "Content-Type" => "text/plain" }, [output]]
  end

  private

  def find_fibonacci_target(target_time = 0.5)
    n = 1
    result = nil
    elapsed = 0

    # Keep calculating with increasing n until we reach the target
    while elapsed < target_time
      # Reset timer for each calculation to measure individual N time
      start_time = Time.now
      result = calculate_fibonacci(n)
      elapsed = Time.now - start_time

      puts "N=#{n} took #{elapsed.round(2)}s"
      n += 1 if elapsed < target_time
    end

    [n, elapsed, result]
  end

  # Recursive Fibonacci calculation (intentionally inefficient for CPU load)
  def calculate_fibonacci(n)
    return n if n <= 1
    calculate_fibonacci(n - 1) + calculate_fibonacci(n - 2)
  end
end
