class AddIndexesToRequest < ActiveRecord::Migration[8.0]
  def up
    # Enable trigram extension if not already enabled
    enable_extension "pg_trgm" unless extension_enabled?("pg_trgm")

    # Add B-Tree index for numeric/range queries
    add_index :requests, :part_year, name: "index_requests_on_part_year"

    # Add trigram indexes for text searches
    add_index :requests, :part_name,  using: :gin, opclass: :gin_trgm_ops, name: "index_requests_on_part_name_trgm"
    add_index :requests, :part_model, using: :gin, opclass: :gin_trgm_ops, name: "index_requests_on_part_model_trgm"
    add_index :requests, :part_brand, using: :gin, opclass: :gin_trgm_ops, name: "index_requests_on_part_brand_trgm"
  end

  def down
    # Remove trigram indexes
    remove_index :requests, name: "index_requests_on_part_name_trgm"
    remove_index :requests, name: "index_requests_on_part_model_trgm"
    remove_index :requests, name: "index_requests_on_part_brand_trgm"

    # Remove B-Tree index
    remove_index :requests, name: "index_requests_on_part_year"
  end
end
