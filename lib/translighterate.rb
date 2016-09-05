require 'action_view'
include ActionView::Helpers::TextHelper

class Translighterate
  def self.highlight(text, phrases, options = {})
    text = sanitize(text) if options.fetch(:sanitize, true)

    if text.blank? || phrases.blank?
      text || ""
    else
      match = Array(phrases).map do |p|
        Regexp === p ? p.to_s : Regexp.escape(p)
      end.join('|')

      # Transliteration trick from:
      #  https://github.com/cubing/worldcubeassociation.org/issues/238#issuecomment-234702800
      transliterated = text.mb_chars.normalize(:kd).gsub(/[\p{Mn}]/,'').to_s
      transliterated.gsub(/(#{match})(?![^<]*?>)/i) do |found|
        original_text_found = text[Range.new(*$~.offset(0), true)]
        if block_given?
          yield original_text_found
        else
          highlighter = options.fetch(:highlighter, '<mark>\1</mark>')
          highlighter.gsub(/\\1/, original_text_found)
        end
      end
    end.html_safe
  end
end
