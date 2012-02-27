Gem::Specification.new do |s|
  s.name = "string_case_pl"
  s.version = "0.1.2"
  s.date = "#{Time.now.strftime("%Y-%m-%d")}"
  s.required_ruby_version = '>= 1.9.2'
  s.summary = "Additional support for Polish encodings in Ruby 1.9"
  s.email = "apohllo@o2.pl"
  s.homepage = "https://github.com/apohllo/string_pl"
  s.description = "Polish extensions for Ruby 1.9 String #upcase(!), #downcase(!), #capitalize(!) and #<=> supporting polish diacritics"
  s.require_path = "lib"
  s.authors = ['Aleksander Pohl',"hosiawak","sebcioz"]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  #s.rdoc_options = ["--main", "README.txt"]
  #s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
end


