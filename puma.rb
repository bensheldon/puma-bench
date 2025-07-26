enable_keep_alives ENV['PUMA_KEEP_ALIVE'] == "1"

threads_count = ENV.fetch("PUMA_THREADS", 3)
threads threads_count, threads_count

workers 0

environment "production"
port ENV.fetch("PORT", 3000)
