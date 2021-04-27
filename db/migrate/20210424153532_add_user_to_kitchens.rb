class AddUserToKitchens < ActiveRecord::Migration[6.0]
  def change
    add_reference :kitchens, :user, foreign_key: true
  end
end
