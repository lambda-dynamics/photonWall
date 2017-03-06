require 'exifr'

module Paperclip
  class ArtistWatermark < Processor
    attr_accessor :format, :whiny, :position

    def initialize file, options = {}, attachment = nil
      super
      @file = file
      @whiny = options[:whiny].nil? ? true : options[:whiny]
      @format = options[:format]
      @position = options[:position].nil? ? "South" : options[:position]

      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
    end

    def make
      dst = Tempfile.new([@basename, @format].compact.join("."))
      dst.binmode

        data = EXIFR::JPEG.new(@file.path)
        name = data.artist
	if name && name.match(/\w+/)
        puts "Annotating #{name}"

        command = "convert"
        params = "-fill white -undercolor '#000000aa' -gravity NorthEast -pointsize 64 -annotate +100+100 ' Photo by #{name} ' #{fromFile} #{toFile(dst)}"
        begin
          success = Paperclip.run(command, params)
        rescue PaperclipCommandLineError
          raise PaperclipError, "There was an error processing the watermark for #{@basename}" if @whiny
        end
	end

        dst
    end

    def fromFile
      "\"#{File.expand_path(@file.path)}[0]\""
    end

    def toFile dst
      "\"#{File.expand_path(dst.path)}[0]\""
    end
  end
end
