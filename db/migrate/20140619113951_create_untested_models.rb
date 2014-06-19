class CreateUntestedModels < ActiveRecord::Migration
  def change
    create_table :untested_models do |t|
      t.string :field

      t.timestamps
    end
  end
end
