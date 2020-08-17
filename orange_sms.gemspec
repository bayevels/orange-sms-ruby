require_relative 'lib/orange_sms/version'

Gem::Specification.new do |spec|
  spec.name          = 'orange_sms'
  spec.version       = OrangeSms::VERSION
  spec.authors       = ['Serigne Mouhamadou Bassirou Diaby']

  spec.summary       = 'ruby client that allows to send sms via the orange api'
  spec.homepage      = 'https://github.com/bayevels/orange-sms-ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.0.0')

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '>= 0.9', '< 2.0'
end
