require 'rake/testtask'

desc "Run Minitest specs"
Rake::TestTask.new :spec do |task|
  task.libs << 'spec'
  task.test_files = FileList['spec/**/*_spec.rb']
end

