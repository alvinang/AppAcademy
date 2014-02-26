require 'erb'
require 'active_support/inflector'
require_relative 'params'
require_relative 'session'


class ControllerBase
  attr_reader :params, :req, :res

  # setup the controller
  def initialize(req, res, route_params = {})
    @req, @res, @route_params = req, res, route_params
    @already_built_response = false
    @params = Params.new(@req, @route_params)    
  end

  # populate the response with content
  # set the responses content type to the given type
  # later raise an error if the developer tries to double render
  def render_content(content, type)
    raise 'Already built response' if self.already_rendered?    
    @res.body = content
    @res.content_type = type
    session.store_session(@res)
    
    @already_built_response = true
  end

  # helper method to alias @already_rendered
  def already_rendered?    
    @already_built_response 
  end

  # set the response status code and header
  def redirect_to(url)
    raise 'Already built response' if self.already_rendered?    
    @already_built_response = true
    @res.header['location'] = url
    @res.status = 302   
    session.store_session(@res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    file_path = "views/#{self.class.name.underscore}/#{template_name}.html.erb"
    content = ERB.new(File.read(file_path)).result(binding)
    render_content(content,'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name)
    self.render(name) unless already_rendered? 
  end
end

class Flash
  
  def initialize
  
  end
  
end
