class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text    :body
      t.integer :access, default: Message.accesses[Message::BOTH_ACCESS]
      t.boolean :read,   default: false

      t.references :user
      t.references :dialog

      t.timestamps
    end
  end
end
