Pod::Spec.new do |s|
  s.name = 'JATableViewRowAction'
  s.version = '0.1.2'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'A custom TableViewRowAction to use only image and image with text.'
  s.homepage = 'https://github.com/assisjeferson/JATableViewRowAction'
  s.authors = { 'assisjeferson' => 'assis.jeferson@hotmail.com' }
  s.source = { :git => 'https://github.com/assisjeferson/JATableViewRowAction.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.ios.frameworks = 'UIKit', 'Foundation'
  s.source_files = 'Source/**/*.swift'
  s.requires_arc = true
end