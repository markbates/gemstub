class YamlGenerator < Genosaurus
  
  def output_dir
    param('output_dir') || 'config'
  end
  
end