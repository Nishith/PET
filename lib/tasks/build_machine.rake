require 'rubygems'
require 'rake'
require 'fileutils'
require 'bundler' 

desc "Task for the build machine"
task :continuous_integration  => ['db:migrate', 'spec']

