class GameWatchesController < ApplicationController

	def index
		@watches = GameWatch.current_season_watches
	end
end