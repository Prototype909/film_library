class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :film_id
      t.integer :user_id
    end
  end
end
