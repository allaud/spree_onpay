Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = 'spree_onpay'
  spec.version     = '0.2.2'
  spec.summary     = 'Payment method for onpay.ru'
  spec.required_ruby_version = '>= 1.8.7'

  spec.authors	= ['Reshetov Andrei']
	spec.email = 'john.jones@example.com'
  spec.homepage	= 'https://github.com/reshetov/spree_onpay'
  spec.files	= `git ls-files`.split("\n")
  spec.test_files	= `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables	= `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = [ 'lib' ]
  spec.requirements << 'none'

  spec.add_dependency('spree_core', '>= 0.40.0')
end
