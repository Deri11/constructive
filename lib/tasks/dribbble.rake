namespace :dribbble do
  desc "TODO"
  task get_recent: :environment do

    url="https://api.dribbble.com/v1/shots/?sort=recent&access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"

    response= HTTParty.get(url)
    recent_shots =JSON.parse(response.body)

    recent_shots.each do |s|
      ns= Shot.new
      ns.dribbble_id = s["id"]
      ns.title = s["title"]
      ns.description = s["description"]
      ns.width = s["width"]
      ns.height = s["height"]
      ns.images_hidpi = s["images"]["hidpi"]
      ns.images_normal = s["images"]["normal"]
      ns.images_teaser = s["images"]["teaser"]
      ns.viewcount = s["views_count"]
      ns.likes_count = s['likes_count']
      ns.comments_count = s['comments_count']
      ns.attachments_count = s['attachments_count']
      ns.rebounds_count = s['rebounds_count']
      ns.buckets_count = s['buckets_count']
      ns.html_url = s['html_url']
      ns.attachments_url = s["attatchments_url"]
      ns.buckets_url = s['buckets_url']
      ns.comments_url = s['comments_url']
      ns.likes_url = s['likes_url']
      ns.projects_url = s['projects_url']
      ns.animated = s['animated']
      ns.tags = s['tags']
      ns.user_id = s['user']['id']
      ns.user_name = s['user']['name']
      ns.user_username = s['user']['username']
      ns.user_html_url = s['user']['html_url']
      ns.user_avatar_url = s['user']['avatar_url']
      ns.user_bio = s['user']['bio']
      ns.user_location = s['user']['location']
      ns.buckets_count = s['user']['buckets_count']
      ns.comments_received_count = s['user']['comments_received_count']
      ns.followers_count = s['user']['followers_count']
      ns.followings_count = s['user']['followings_count']
      ns.likes_count = s['user']['likes_count']
      ns.likes_received_count = s['user']['likes_received_count']
      ns.projects_count = s['user']['projects_count']
      ns.rebounds_received_count = s['user']['rebounds_received_count']
      ns.shots_count = s['user']['shots_count']
      ns.teams_count = s['user']['teams_count']
      ns.can_upload_shot = s['user']['can_upload_shot']
      ns.dribbble_type = s['user']['type']
      ns.pro = s['user']['pro']
      ns.followers_url = s['user']['followers_url']
      ns.following_url = s['user']['following_url']
      ns.shots_url = s['shots_url']
      ns.teams_url = s['teams_url']
      ns.team = s['user']['team']

      ns.save


    end

  end


    # s= Shot.new
    # s.title = "test shot"
    # s.save
  # puts "Constructive is getting most recent shots"
  # puts recent_shots

  # end

  desc "TODO"
  task get_popular: :environment do
    url="https://api.dribbble.com/v1/shots/?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"

    response= HTTParty.get(url)
    recent_shots =JSON.parse(response.body)

    recent_shots.each do |s|
      ns= Shot.new
      ns.dribbble_id = s["id"]
      ns.title = s["title"]
      ns.description = s["description"]
      ns.width = s["width"]
      ns.height = s["height"]
      ns.images_hidpi = s["images"]["hidpi"]
      ns.images_normal = s["images"]["normal"]
      ns.images_teaser = s["images"]["teaser"]
      ns.viewcount = s["views_count"]
      ns.likes_count = s['likes_count']
      ns.comments_count = s['comments_count']
      ns.attachments_count = s['attachments_count']
      ns.rebounds_count = s['rebounds_count']
      ns.buckets_count = s['buckets_count']
      ns.html_url = s['html_url']
      ns.attachments_url = s["attatchments_url"]
      ns.buckets_url = s['buckets_url']
      ns.comments_url = s['comments_url']
      ns.likes_url = s['likes_url']
      ns.projects_url = s['projects_url']
      ns.animated = s['animated']
      ns.tags = s['tags']
      ns.user_id = s['user']['id']
      ns.user_name = s['user']['name']
      ns.user_username = s['user']['username']
      ns.user_html_url = s['user']['html_url']
      ns.user_avatar_url = s['user']['avatar_url']
      ns.user_bio = s['user']['bio']
      ns.user_location = s['user']['location']
      ns.buckets_count = s['user']['buckets_count']
      ns.comments_received_count = s['user']['comments_received_count']
      ns.followers_count = s['user']['followers_count']
      ns.followings_count = s['user']['followings_count']
      ns.likes_count = s['user']['likes_count']
      ns.likes_received_count = s['user']['likes_received_count']
      ns.projects_count = s['user']['projects_count']
      ns.rebounds_received_count = s['user']['rebounds_received_count']
      ns.shots_count = s['user']['shots_count']
      ns.teams_count = s['user']['teams_count']
      ns.can_upload_shot = s['user']['can_upload_shot']
      ns.dribbble_type = s['user']['type']
      ns.pro = s['user']['pro']
      ns.followers_url = s['user']['followers_url']
      ns.following_url = s['user']['following_url']
      ns.shots_url = s['shots_url']
      ns.teams_url = s['teams_url']
      ns.team = s['user']['team']

      ns.save
    end
  end





end
