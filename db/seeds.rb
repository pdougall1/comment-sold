require 'csv'

dir = Rails.root.join('db', 'seed_data')

# Creating the rows one at a time lets Rails validations work to maintian data integrity
# But the seed takes a minute :/


Dir.foreach(dir) do |filename|
  next if filename == '.' or filename == '..'

  resource_name = filename.split('.').first
  resource = resource_name.singularize.camelize.constantize
  rows = []

  resource.delete_all

  CSV.parse(File.read("#{dir}/#{filename}"), headers: true) do |row|
    if resource == User
      row = row.to_h

      row['password'] = row['password_plain']
    end

    rows << resource.new(row.to_h)
  end
  
  resource.import(rows)

  puts "Created #{resource.count} #{resource_name.pluralize}"
end
