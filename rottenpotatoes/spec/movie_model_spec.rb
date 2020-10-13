require 'rails_helper'

describe Movie do
  
  context 'other movies by that director' do
    it 'finds movies with same director' do
      @movie1 = Movie.create(:id => "210", title: "Other1", director: "Director")
      @movie2 = Movie.create(:id => "215", title: "Other2", director: "Director")
      results = Movie.similar_movies(@movie1.id)
      expect(results).to eq([@movie1,@movie2])
    end        
  end    

  context 'no other movies by that director' do
    it 'finds no other movies with same director' do
      @movie1 = Movie.create(:id => "555", title: "Other1", director: "Director")
      @movie2 = Movie.create(:id => "666", title: "Other2", director: "Director2")
      results = Movie.similar_movies(@movie1.id)
      expect(results).not_to eq([@movie1,@movie2])
    end
  end
end 