desc "Generate json file for gettext translations"
task :"makemo:json" do
  translations = {}

  Dir.glob("po/*/") do |folder|
    lang = File.basename(folder)
    translations[lang] = {}

    Dir.glob(File.join(folder, '*.po')) do |file|
      code = File.read(file)
      msgs = code.scan(/^msgid "(.*?)"\nmsgstr "(.*?)"\n(?:\n|$)/m).each do |msg|
        translations[lang][msg[0]] = msg[1].gsub(/["\n]/, '') unless msg[0].empty?
      end
    end
  end

  File.open('public/javascripts/gettext_json_translations.js', 'w') do |f|
    f.write 'GetText.translations = '
    f.write translations.to_json
    f.write ";"
  end
end
