module PlaylistsHelper

    def pick_pl_form_url(playlist)
        if !playlist.id
            new_user_playlist_path(current_user)
        else
            edit_user_playlist_path(playlist.user_id, playlist)
        end
    end
end
