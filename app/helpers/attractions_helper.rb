module AttractionsHelper

  # helper method that finds the "liked" join tables and then returns
  # the attraction objects for each "liked" attraction
  def find_my_attractions(city)
    user_attractions = @user.user_attractions.where(city_id: @city.id, preference: true)
    @attractions = []
    user_attractions.each do |row|
      @attractions << Attraction.where(id: row.attraction_id).first
    end
    @attractions
  end

end
