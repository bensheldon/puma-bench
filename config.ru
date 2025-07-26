#!/usr/bin/env ruby
# frozen_string_literal: true

# A simple Rack application that performs a CPU-bound Fibonacci calculation
# designed to take approximately 1 second and returns "ok"

# Require the FibonacciApp class
require_relative 'fibonacci_app'

# Run the application
run FibonacciApp.new
