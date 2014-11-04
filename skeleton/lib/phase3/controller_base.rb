require_relative '../phase2/controller_base'
require 'active_support/core_ext'
require 'erb'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      controller_name = self.class.to_s.underscore
      filename = "views/#{controller_name}/#{template_name}.html.erb"
      file = File.read(filename)
      erbed_file = ERB.new(file)
      type = "text/html"


      render_content(erbed_file.result(binding), type)
    end
  end
end
