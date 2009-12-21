def colorize(text)
  "\e[33m#{text}\e[0m"
end

class GettextJsonGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'public/javascripts'
      m.template 'gettext_json.js', File.join('public/javascripts', 'gettext_json.js')
      m.directory 'lib'
      m.template 'js_parser.rb', File.join('lib', 'js_parser.rb')
      m.directory 'lib/tasks'
      m.template 'gettext_json.rake', File.join('lib/tasks', 'gettext_json.rake')
    end
  end

  def after_generate
      puts <<-ALERT

                            ATTENTION !

In order to use the gettext_json library, add the following line in your layout :
    #{colorize("javascript_include_tag 'gettext_json.js'")}

To add JavaScript files parser in your updatepo rake task, add this in the task code :
    #{colorize("require 'js_parser'")}

To generate the translations json file use the following rake task :
    #{colorize("rake makemo:json")}
And then add the following line in your layout :
    #{colorize("javascript_include_tag 'gettext_json_translations.js'")}

ALERT
  end
end
