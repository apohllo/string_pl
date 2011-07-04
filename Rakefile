task :default => [:test]

$gem_name = "string_case_pl"

desc "Build the gem"
task :build do
  sh "gem build #$gem_name.gemspec"
end

desc "Install the library at local machnie"
task :install => :build do
  sh "sudo gem install #$gem_name"
end

desc "Uninstall the library from local machnie"
task :uninstall do
  sh "sudo gem uninstall #$gem_name"
end

desc "Run tests"
task :test do
  sh "ruby test/test_character_case_change.rb"
  sh "ruby test/test_comparison.rb"
end

desc "Clean"
task :clean do
  sh "rm #$gem_name*.gem"
end
