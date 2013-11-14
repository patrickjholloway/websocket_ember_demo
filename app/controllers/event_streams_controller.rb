class EventStreamsController < ApplicationController
  respond_to :json
  skip_before_filter :require_login

  before_filter :find_stream_by_id, only: [:show, :destroy, :update]
  
  include Tubesock::Hijack
  
  def index
    @event_streams = EventStream.all
    render action: 'index'
  end
  
  def create
    @event_stream = EventStream.create(params[:event_stream])
    render action: 'show'
  end
  
  def update
    @event_stream =  EventStream.update(params[:id], params[:event_stream])
    render action: 'show'
  end
  
  def destroy
    @event_stream =  EventStream.destroy(params[:id])
    render action: 'show'
  end
  
  def show
    render action: 'show'
  end
  
  private

  def find_stream_by_id
    @event_stream = EventStream.find(params[:id])
  end
end
