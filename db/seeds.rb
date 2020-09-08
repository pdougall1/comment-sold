require 'csv'

dir = Rails.root.join('db', 'seed_data')

Dir.foreach(dir) do |filename|
  next if filename == '.' or filename == '..'

  resource_name = filename.split('.').first
  resource = resource_name.camelize.constantize

  CSV.parse(File.read("#{dir}/#{filename}"), headers: true) do |row|
    resource.create!(to_h)
  end

  puts "Created #{resource.count} #{resource_name.pluralize}"
end
