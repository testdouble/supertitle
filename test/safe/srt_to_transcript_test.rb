require "supertitle"

class SrtToTranscriptTest < Minitest::Test
  def test_scna
    srt = File.read("test/fixtures/scna.srt")
    supertitles = Supertitle.read(srt, :srt)
    transcript = Supertitle.write(supertitles, :transcript)
    assert_equal File.read("test/fixtures/scna-transcript.txt").chomp, transcript
  end

  def test_how_to_program
    srt = File.read("test/fixtures/how-to-program.srt")
    supertitles = Supertitle.read(srt, :srt)
    transcript = Supertitle.write(supertitles, :transcript)
    assert_equal File.read("test/fixtures/how-to-program-transcript.txt").chomp, transcript
  end
end
