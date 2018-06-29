require 'simplecov' if ENV["COVERAGE"] == "true"

$LOAD_PATH.unshift(File.join(Gem.loaded_specs['activeadmin-core'].gem_dir, 'spec'))
