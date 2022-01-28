class CreateHousesAgentsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :houses, :agents
  end
end
