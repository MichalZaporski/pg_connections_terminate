# frozen_string_literal: true

module ::PgConnectionsTerminate
  class Railtie < ::Rails::Railtie
    rake_tasks do
      namespace :db do
        namespace :connections do
          desc 'Terminates all the connections with the database from config/database.yml for the current RAILS_ENV'
          task terminate: :environment do
            db_name = ::Rails.configuration.database_configuration[::Rails.env]['database']
            query = <<~SQL
              SELECT pg_terminate_backend(pg_stat_activity.pid)
              FROM pg_stat_activity
              WHERE pg_stat_activity.datname = '#{db_name}'
              AND pid <> pg_backend_pid();
            SQL

            ::ActiveRecord::Base.connection.execute(query)

            puts "All connections with the \"#{db_name}\" database have been terminated."
          end
        end
      end
    end
  end
end
