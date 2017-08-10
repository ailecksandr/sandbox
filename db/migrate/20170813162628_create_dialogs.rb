class CreateDialogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dialogs do |t|
      t.references :creator,   references: :users, index: true
      t.references :companion, references: :users, index: true

      t.timestamps
    end
  end
end
