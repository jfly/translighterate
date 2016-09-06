require 'action_view'
include ActionView::Helpers::TextHelper

class Translighterate
  # Copied (and modified!) from
  #  https://github.com/rails/rails/blob/495ef4124e292dcc7062e3e1f04f623053113101/actionview/lib/action_view/helpers/text_helper.rb#L130
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

      previous_match_end_index = 0
      result = ""
      transliterated.scan(/(#{match})(?![^<]*?>)/i) do
        match_range = $~.offset(0)
        result += text[previous_match_end_index...match_range[0]]
        original_text_found = text[Range.new(*match_range, true)]
        previous_match_end_index = match_range[1]

        result += if block_given?
                    yield original_text_found
                  else
                    highlighter = options.fetch(:highlighter, '<mark>\1</mark>')
                    highlighter.gsub(/\\1/, original_text_found)
                  end
      end
      result += text[previous_match_end_index..-1]
    end.html_safe
  end
end
