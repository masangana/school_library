require 'fileutils'
require 'json'

def create_dir
  Dir.exist?('./data') ? nil : create_files
end

def create_files
  Dir.mkdir('./data')
  FileUtils.touch('./data/books.json')
  FileUtils.touch('./data/people.json')
  FileUtils.touch('./data/rental.json')
end
