class CreatePostulants < ActiveRecord::Migration[5.1]
  def change
    create_table :postulants do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
