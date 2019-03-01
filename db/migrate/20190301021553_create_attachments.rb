class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.references :subject, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
