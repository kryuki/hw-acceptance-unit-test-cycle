require 'rails_helper'

describe MoviesController, type: 'controller' do
    let(:movies) { ['star wars', 'raiders'] }    

    context '#search_directors' do
      describe 'movie has a director' do
        # integration test (route spec)
        it 'responds to the search_directors route' do
          @movie = Movie.create(:id => "100", title: "Titanic", director: "Director1")
          get :search_directors, { id: 100 }
          end
        end 

      describe 'search similar movies' do
        it 'queries the Movie model about similar movies' do
          # YOUR TEST CODE HERE
          @movie_1 = Movie.create(:id => "204", title: "Titanic", director: "Director1")
          get :search_directors, id: @movie_1[:id]
          expect(response).to redirect_to(movies_path)
          #fail
        end
        
        it 'assigns similar movies to the template' do
          @movie_2 = Movie.create(:id => "205", title: "Green Book", director: "Director1")
          @movie_3 = Movie.create(:id => "206", title: "Inception", director: "Director1")
          get :search_directors, id:@movie_2[:id]
          expect(Movie.where(:director => @movie_2.director).size).to eq(2)
          #fail
        end
      end
      describe "create" do
        let(:params) {{:title => "Alien"}}
        let(:movie) {double('movie', params)}
      
        it 'calls the create method to create a new movie' do
          expect(Movie).to receive(:create!).with(params).and_return(movie)
          post :create, {movie: params}  
        end
      end
      
      describe "destroy" do
        let(:movie) {double('movie',:title => 'Shrek')}
        let(:id) {'200'}
        
        it 'calls the find method to retrieve a movie' do
          expect(Movie).to receive(:find).with(id).and_return(movie)
          allow(movie).to receive(:destroy)
          delete :destroy, {:id => id}
        end
      end
    end
  end
  