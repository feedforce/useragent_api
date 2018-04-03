#!/usr/bin/env ruby

require 'yaml'

# rubocop's TargetRubyVersion should be the oldest version in .travis.yml

target = YAML.load_file('.rubocop.yml')['AllCops']['TargetRubyVersion'].to_s
oldest = YAML.load_file('.travis.yml')['rvm'].min

exit 1 unless oldest.start_with?(target)
