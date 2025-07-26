#!/bin/bash
# Script to run either Thruster or Puma based on USE_THRUSTER environment variable

# Check if USE_THRUSTER is set and not empty
if [ -n "$USE_THRUSTER" ] && [ "$USE_THRUSTER" != "0" ] && [ "$USE_THRUSTER" != "false" ]; then
  echo "Starting server with Thruster..."
  HTTP_PORT=${PORT:-3000} TARGET_PORT=3001 bundle exec thrust puma -C puma.rb
else
  echo "Starting server with Puma..."
  bundle exec puma -C puma.rb
fi
