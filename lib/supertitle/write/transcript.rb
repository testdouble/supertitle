require "time"

module Supertitle::Write
  class Transcript
    def initialize(lines)
      @lines = lines
      @over_an_hour = lines.any? {|l| l.start > (1000 * 60 * 60) }
    end

    def write
      @lines.map { |line|
        "[#{timestamp_for(line.start)}] #{line.text}"
      }.join("\n")
    end

    private

    def timestamp_for(ms)
      seconds, ms = ms.divmod(1000)
      minutes, seconds = seconds.divmod(60)
      hours, minutes = minutes.divmod(60)

      components = @over_an_hour ? [hours, minutes, seconds] : [minutes, seconds]
      components.map { |t| sprintf("%02d", t) }.join(":")
    end
  end
end
