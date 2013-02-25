class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.references  :user
      t.timestamps
    end
  end
end
