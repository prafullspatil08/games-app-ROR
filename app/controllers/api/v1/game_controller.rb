module Api
    module V1
        class GameController < ApplicationController
            # GET /games
            def index
                @games = Game.order(created_at: :asc)
                render json: { success: true, message: "Loaded games", data: @games }, status: :ok
            end

            # GET by id /game
            def show
                @game = Game.find(params[:id])
                render json: { success: true, message: "Loaded game by id", data: @game }, status: :ok
            end

            # POST /game
            def create
                @game = Game.new(game_params)

                if @game.save
                    render json: { success: true, message: "Saved game" }, status: :created
                else
                    render json: { success: true, message: "Game not saved", data: @game.errors }, status: :ok
                end
            end

            # DELETE /game
            def destroy
                @game = Game.find(params[:id])
                @game.destroy
                render json: { success: true, message: "Deleted game", data: @game }, status: :ok
            end

            # PUT /game
            def update
                @game = Game.find(params[:id])
                if @game.update(game_params)
                    render json: { success: true, message: "Updated game" }, status: :ok
                else
                    render json: { success: true, message: "Game not updated", data: @game.errors }, status: :ok
                end
            end



            private

            def game_params
                params.permit(:title, :genre, :platform)
            end
        end
    end
end
