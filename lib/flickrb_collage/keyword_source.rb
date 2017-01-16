module FlickrbCollage
  class KeywordSource
    attr_reader :dictionary_path

    def initialize(dictionary_path = '/usr/share/dict/words')
      @dictionary_path = dictionary_path
    end

    def call
      File.readlines(dictionary_path).sample
    end
  end
end
