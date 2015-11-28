if ENV['DEBUG_REQUIRE']
  require 'benchmark'

  def require(file)
    @first ||= Time.now

    required = nil
    elapsed = Benchmark.measure do
      required = super
    end

    if ENV['DEBUG_REQUIRE'].to_f < elapsed.total
      total = elapsed.format("%t require #{file}")
      from_start = (Time.now - @first).to_i
      $stdout.puts "#{total} (#{from_start} second(s) from start)"
    end

    required
  end
end

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
