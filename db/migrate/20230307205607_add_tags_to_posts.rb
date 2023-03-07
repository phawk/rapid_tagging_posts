class AddTagsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :tags, :jsonb, null: false, default: []
  end
end
