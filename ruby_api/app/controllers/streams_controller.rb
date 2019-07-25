class StreamsController < ApplicationController
  before_action :set_stream, only: [:show, :update, :destroy]

  def index
    @streams = Stream.all
    json_response(@streams)
  end

  def create
    @stream = Stream.create!(stream_params)
    json_response(@stream, :created)
  end

  def show
    json_response(@stream)
  end

  def update
    @stream.update(stream_params)
    head :no_content
  end

  def destroy
    @stream.destroy
    head :no_content
  end

  private
  def stream_params
    params.permit(:title, :description, :userId)
  end
  def set_stream
    @stream = Stream.find(params[:id])
  end
end
