Gem::Specification.new do |s|
  s.name = "string_case_pl"
  s.version = "0.1.1"
  s.date = "2011-08-02"
  s.required_ruby_version = '>= 1.9.2'
  s.summary = "Additional support for Polish encodings in Ruby 1.9"
  s.email = "apohllo@o2.pl"
  s.homepage = "https://github.com/apohllo/string_pl"
  s.description = "Polish extensions for Ruby 1.9 String #upcase(!), #downcase(!), #capitalize(!) and #<=> supporting polish diacritics"
  s.require_path = "lib"
  s.authors = ['Aleksander Pohl',"hosiawak","sebcioz"]
  s.files = ["Rakefile", "string_case_pl.gemspec", 'lib/string_case_pl.rb'] +
    Dir.glob("lib/**/*")
  s.test_files = Dir.glob("{test}/**/*")
  #s.rdoc_options = ["--main", "README.txt"]
  #s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
end


