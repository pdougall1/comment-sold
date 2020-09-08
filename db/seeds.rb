require 'csv'

dir = Rails.root.join('db', 'seed_data')

# Creating the rows one at a time lets Rails validations work to maintian data integrity
# But the seed takes a minute :/

Dir.foreach(dir) do |filename|
  next if filename == '.' or filename == '..'

  resource_name = filename.split('.').first
  resource = resource_name.singularize.camelize.constantize

  CSV.parse(File.read("#{dir}/#{filename}"), headers: true) do |row|
    resource.create!(row.to_h)
  end

  puts "Created #{resource.count} #{resource_name.pluralize}"
end
