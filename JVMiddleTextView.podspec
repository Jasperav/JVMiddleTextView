Pod::Spec.new do |s|
  s.name             = 'JVMiddleTextView'
  s.version          = '0.3.3'
  s.summary          = 'A short description of JVMiddleTextView.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Jasperav/JVMiddleTextView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jasper' => 'Jasperav@hotmail.com' }
  s.source           = { :git => 'https://github.com/Jasperav/JVMiddleTextView.git', :tag => s.version.to_s }


  s.ios.deployment_target = '13.0'

  s.source_files = 'JVMiddleTextView/Classes/**/*'
  
   s.dependency 'JVConstraintEdges'
   s.dependency 'JVView'
   s.dependency 'JVDebugProcessorMacros'
end
