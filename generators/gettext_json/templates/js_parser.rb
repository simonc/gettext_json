require 'gettext_rails/tools'

module JsParser
  module_function

  def target?(file)
    File.extname(file) == ".js"
  end

  def parse(file, ary = [])
    js = File.read(file)
    code = js.scan(/GetText.t(?:ranslate)? ?\(['"].*?['"]\)/).map { |s| s.gsub(/GetText.t(?:ranslate)? ?/, '_') }
    GetText::RubyParser.parse_lines(file, code, ary)
  end
end

GetText::RGetText.add_parser(JsParser)
