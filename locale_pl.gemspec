Gem::Specification.new do |s|
  s.name = "locale_pl"
  s.version = "0.0.1"
  s.date = "2009-12-27"
  s.summary = "Support for Polish String encodings in Ruby 1.9"
  s.email = "apohllo@o2.pl"
  s.homepage = "http://apohllo.pl/blog"
  s.description = "Polish extensions for Ruby 1.9 String #upcase and #downcase supporting polish diacritics"
  s.require_path = "lib"
  s.has_rdoc = false
  s.authors = ['Aleksander Pohl']
  s.files = ["Rakefile", "locale_pl.gemspec", 'lib/locale_pl.rb'] + 
    Dir.glob("lib/**/*")
  s.test_files = Dir.glob("{test,spect}/**/*")
  #s.rdoc_options = ["--main", "README.txt"]
  #s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
end


