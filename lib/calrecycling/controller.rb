require 'erb'

module CalRecycling
  class Controller
    def indexAction
      render("index")
    end

    private

    def render(action)
      template = File.read("#{File.dirname(__FILE__)}/templates/index.html.erb")
      renderer = ERB.new(template)
      renderer.result()
    end
  end
end