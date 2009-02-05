class GemGenerator < Genosaurus
  
  require_param :app
  
  def app
    param(:app)
  end
  
  def version
    param(:version) || '0.0.1'
  end
  
  def author
    param(:author) || (ENV["USERNAME"] || ENV["USER"])
  end
  
end