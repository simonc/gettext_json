begin
  require File.join(File.dirname(__FILE__), 'lib', 'gettext_json')
rescue LoadError
  begin
    require 'gettext_json'
  rescue LoadError => e
    raise e unless defined?(Rake) && Rake.application.top_level_tasks.include?('gems:install')
  end
end
