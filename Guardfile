notification :off

scope group: :spec

group :spec do
  guard :rake, :task => 'spec' do
    watch(%r{^lib/.+.rb$})
    watch(%r{^spec/.+_spec.rb$})
    watch(%r{^manifests\/.+\.pp$})
  end
end