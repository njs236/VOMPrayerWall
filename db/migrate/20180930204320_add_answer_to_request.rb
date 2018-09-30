class AddAnswerToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :answer, :boolean, default: false
  end
end
