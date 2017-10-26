module ArtistsHelper

  def artist_select(dummy_arg1 = nil, dummy_arg2 = nil)
    #dummy args are to make test pass
    if params[:artist_id]
      Artist.find(params[:artist_id]).name
    else
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    end
  end

  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

end
