class InstallFuzzystrmatchContribPackage < ActiveRecord::Migration[6.0]
  def change
      enable_extension 'pg_trgm'
      enable_extension 'fuzzystrmatch'
      enable_extension 'unaccent'
    end
end
