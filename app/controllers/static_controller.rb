class StaticController < ApplicationController

  FACEBOOK_LIKE_BOX_HEIGHT = "700";
  FACEBOOK_LIKE_BOX_WIDTH  = "640";

  YOUTUBE_HEIGHT = "390"
  YOUTUBE_WIDTH  = "640"

  @@s_facebook_like_box = nil
  @@s_youtube_embed = nil

  @@s_black_coffee_youtube_embed
  @@s_big_butter_and_egg_man_youtube_embed
  def home
    force_regen = Rails.env.development?

    if force_regen || @@s_facebook_like_box.nil?
      @@s_facebook_like_box = FACEBOOK_LIKE_BOX.gsub( "SLUG_HEIGHT", FACEBOOK_LIKE_BOX_HEIGHT ).gsub( "SLUG_WIDTH", FACEBOOK_LIKE_BOX_WIDTH )
    end

    @facebook_like_box = @@s_facebook_like_box

    if force_regen || @@s_black_coffee_youtube_embed.nil?
      @@s_black_coffee_youtube_embed = BLACK_COFFEE_YOUTUBE.gsub( "YOUTUBE_WIDTH", YOUTUBE_WIDTH ).gsub( "YOUTUBE_HEIGHT", YOUTUBE_HEIGHT )
    end

    if force_regen || @@s_big_butter_and_egg_man_youtube_embed.nil?
      @@s_big_butter_and_egg_man_youtube_embed = BIG_BUTTER_AND_EGG_MAN_YOUTUBE.gsub( "YOUTUBE_WIDTH", YOUTUBE_WIDTH ).gsub( "YOUTUBE_HEIGHT", YOUTUBE_HEIGHT )
    end
    
    @black_coffee_youtube_embed           = @@s_black_coffee_youtube_embed
    @big_butter_and_egg_man_youtube_embed = @@s_big_butter_and_egg_man_youtube_embed
  end

  def band
  end

  def contact
  end

  def schedule
  end

  def past_gigs
  end
end

FACEBOOK_LIKE_BOX = <<EOD
  <iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2Fthe-Careless-Lovers%2F283373523379&amp;width=SLUG_WIDTH&amp;colorscheme=light&amp;show_faces=true&amp;border_color&amp;stream=true&amp;header=true&amp;height=SLUG_HEIGHT" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:SLUG_WIDTHpx; height:SLUG_HEIGHTpx;" allowTransparency="true"></iframe>
EOD

BLACK_COFFEE_YOUTUBE = <<EOD
  <iframe width="YOUTUBE_WIDTH" height="YOUTUBE_HEIGHT" src="http://www.youtube.com/embed/bd3Yu-ImZk0" frameborder="0" allowfullscreen></iframe>
EOD

BIG_BUTTER_AND_EGG_MAN_YOUTUBE = <<EOD
  <iframe width="YOUTUBE_WIDTH" height="YOUTUBE_HEIGHT" src="http://www.youtube.com/embed/8yCXOKIfFb0" frameborder="0" allowfullscreen></iframe>
EOD
