class PlaylistsController < ApplicationController
  before_action :set_playlist, except: [:new, :create, :index]

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
    if @playlist.save
      redirect_to user_playlist_path(current_user, @playlist)
    else
      render :new 
    end
  end

  def show
  end

  def remove_song
    song = @playlist.songs.find(params[:song_id])
    @playlist.songs.delete(song)
    redirect_to user_playlist_path(current_user, @playlist)
  end

  def index
    @playlists = current_user.playlists
  end

  def edit
  end

  def update
    @playlist.update(playlist_params)
    redirect_to user_playlist_path(current_user, @playlist)
  end

  def destroy
    @playlist.destroy
    redirect_to my_page_path
  end

  def add_songs
    @playlist.add_songs(params[:song_ids])
    redirect_to user_playlist_path(current_user, @playlist)
  end

  def song_select
    @songs = Song.all
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :user_id, song_ids: [])
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end
end
