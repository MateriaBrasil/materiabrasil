# Load the rails application
require File.expand_path('../application', __FILE__)

Slim::Engine.set_default_options :sections => true
# Initialize the rails application
MateriaBrasil::Application.initialize!
