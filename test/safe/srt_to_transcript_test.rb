require "supertitle"

class SrtToTranscriptTest < Minitest::Test
  def test_scna
    srt = File.read("test/fixtures/scna.srt")
    supertitles = Supertitle.read(srt, :srt)
    transcript = Supertitle.write(supertitles, :transcript)
    assert_equal File.read("test/fixtures/scna-transcript.txt"), transcript
  end
end
