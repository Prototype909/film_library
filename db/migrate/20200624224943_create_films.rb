class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
    end
  end
end
