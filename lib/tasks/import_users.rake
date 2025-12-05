require 'csv'

namespace :import do
  desc 'Import users from CSV file'
  task users: :environment do
    csv_path = Rails.root.join('db', 'csv', 'users.csv')
    
    unless File.exist?(csv_path)
      puts "Error: CSV file not found at #{csv_path}"
      puts "Please create the file with the following headers:"
      puts "email,phone,store_name,store_uid,store_address,subscription_tier,terms_and_conditions"
      exit
    end

    success_count = 0
    error_count = 0
    errors = []

    CSV.foreach(csv_path, headers: true, header_converters: :symbol) do |row|
      user = User.new(
        email: row[:email],
        password: 'Q713n3.c0m',
        password_confirmation: 'Q713n3.c0m',
        phone: row[:phone],
        store_name: row[:store_name],
        subscription_tier: row[:subscription_tier] || 'free',
        terms_and_conditions: row[:terms_and_conditions] == 'true' || row[:terms_and_conditions] == '1'
      )

      # Skip email confirmation if confirmable is enabled
      user.skip_confirmation! if user.respond_to?(:skip_confirmation!)

      if user.save
        success_count += 1
        puts "✓ Created user: #{user.email}"
      else
        error_count += 1
        error_msg = "✗ Failed to create user #{row[:email]}: #{user.errors.full_messages.join(', ')}"
        puts error_msg
        errors << error_msg
      end
    end

    puts "\n" + "="*60
    puts "Import completed!"
    puts "Successfully created: #{success_count} users"
    puts "Failed: #{error_count} users"
    puts "="*60

    if errors.any?
      puts "\nErrors:"
      errors.each { |error| puts error }
    end
  end
end
