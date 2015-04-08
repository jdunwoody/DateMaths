require 'colored'
require 'rake/clean'
require 'rubygems'
require 'yaml'

Dir.glob('tasks/*.rb').each { |ruby_file| load ruby_file }
Dir.glob('tasks/*.rake').each { |rake_task| load rake_task }

$scheme = 'DateMaths'
$configuration = 'Debug'

task default: :test
#task default: [:build]
#
#task setup: [:clean] do |t|
#  mkdir_p BUILD_DIR
#  mkdir_p REPORT_DIR
#end
#
#desc 'Clean the project of generated files'
#task :clean do |t|
#  xcodebuild(commands: 'clean', pretty: '-t', task: t)
#  rm_rf BUILD_DIR
#end
#
#desc 'Build FX'
#task :build do |t|
#
#end
#
#desc 'Run full Xcode tests on all devices'
#task :test do |t|
#
#end
#
