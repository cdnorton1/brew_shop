class BeersController < ApplicationController
	before_action :set_beer, only: [:show, :edit, :update, :destroy]

	def home
	end

	def index
		@beers = Beer.all
	end

	def show
	end

	def new
		@beer = Beer.new
	end

	def edit
	end

	def create
    @beer = Beer.new(beer_params)
    respond_to do |format|
      		if @beer.save
        		format.html { redirect_to @beer, notice: 'Beer was successfully created.' }
        		format.json { render :show, status: :created, location: @beer }
      		else
        		format.html { render :new }
        		format.json { render json: @beer.errors, status: :unprocessable_entity }
      		end
    	end
	end

	def update
		respond_to do |format|
      		if @beer.update(beer_params)
        		format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
       		    format.json { render :show, status: :ok, location: @beer }
      		else
        		format.html { render :edit }
        		format.json { render json: @beers.errors, status: :unprocessable_entity }
      		end
    	end
	end

	def destroy
		@beer.destroy
    	respond_to do |format|
      	format.html { redirect_to @beer, notice: 'Beer was successfully destroyed.' }
      	format.json { head :no_content }
    end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    	def set_beer
      		@beer = Beer.find(params[:id])
    	end

    # Never trust parameters from the scary internet, only allow the white list through.
    	def beer_params
      		params.require(:beer).permit(:name, :description, :image)
    	end
	

end
