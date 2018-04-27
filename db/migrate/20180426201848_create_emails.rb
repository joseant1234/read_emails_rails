class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.references :user, foreign_key: true
      t.references :postulant, foreign_key: true
      t.references :attachment, foreign_key: true
      t.text :body
      t.string :subject
      t.string :from
      t.string :to
      t.datetime :send_at

      t.timestamps
    end
  end
end
