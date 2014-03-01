task :default => [:build]

task :build do
  ruby "bin/calrecycling.rb"
  sh "compass compile"
end

task :clean do
  sh "rm -f *.html"
end

task :watch do
  sh "compass watch"
end