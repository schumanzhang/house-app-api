class HouseSerializer < ActiveModel::Serializer
  
  def initialize(house_object)
    @house = house_object
  end

  def to_serialized_json
    @house.to_json(:include => {
      :agents => {:only => [:name, :area]},
    }, :except => [:updated_at])
  end

end
