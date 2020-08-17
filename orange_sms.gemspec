require_relative 'lib/orange_sms/version'

Gem::Specification.new do |spec|
  spec.name          = "orange_sms"
  spec.version       = OrangeSms::VERSION
  spec.authors       = ['Serigne Mouhamadou Bassirou Diaby']
  spec.email         = ["TODO: Write your email address"]

  spec.summary       = %q{TODO: Write a short summary, because RubyGems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.0.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '>= 0.9', '< 2.0'
  spec.add_dependency 'minitest', '~> 5.0'
  spec.add_dependency 'rake', '~> 12.0'
end
