require 'csv'

dir = Rails.root.join('db', 'seed_data')

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

  count = 200
  rows.each_slice(count) do |_rows|
    resource.import(_rows)
    puts "Successfully imported #{_rows.count} #{resource_name}"
  end

  puts "Finished #{resource.count} #{resource_name}"
end
