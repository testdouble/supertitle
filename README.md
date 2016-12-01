# Supertitle

A little gem to help deal with converting between to & from various subtitle and
transcript formats. Right now it only handles conversion of
[SRT](https://en.wikipedia.org/wiki/SubRip#SubRip_text_file_format) files to a
text transcript that's more appropriate for being read by humans.

## CLI

The CLI takes four arguments:

```
Usage: supertitle input_file input_format output_file output_format

Example:
  $ supertitle scna.srt srt scna-script.txt transcript
```

This will read the SRT input file and write a human-readable transcript to
`scna-script.txt`.

## API

### Reading

First, parse some content into "supertitles", the arbitrary object model of this
gem:

```ruby
srt = File.read("test/fixtures/scna.srt")
supertitles = Supertitle.parse(srt, :srt)
```

Supported input formats:

* `:srt` - [SRT](https://en.wikipedia.org/wiki/SubRip#SubRip_text_file_format)

### Object model

The `Supertitle.read` method will return an array of `Supertitle::Line` objects,
each providing `start`, `stop`, and `text` attributes. `start` and `stop` are
millisecond offsets, relative to the start of the subtitles or transcript.
`text` will `strip` and `join` any multi-line subtitles into a single line,
separated by a single space.

### Writing

To write out those supertitles into a supported string format:

```ruby
transcript = Supertitle.write(supertitles, :transcript) #=> a multi-line string
```

Supported output formats:

* `:transcript` - a human-readable custom transcript format (`[mm:ss] text…`)
