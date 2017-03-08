
Pod::Spec.new do |s|
  s.name             = 'RBSafeKit'
  s.version          = '1.0.0'
  s.summary          = '防止app crash的保护机制'
  s.homepage         = 'https://github.com/baxiang/RBSafeKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'baxiang' => 'baxiang1989@163.com' }
  s.source           = { :git => 'https://github.com/baxiang/RBSafeKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'RBSafeKit/Classes/**/*'

end
