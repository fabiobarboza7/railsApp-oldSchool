class AddFileToAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :attachments, :file, :string
  end
end
