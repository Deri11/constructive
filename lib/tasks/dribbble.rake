namespace :dribbble do
  desc "TODO"
  task get_recent: :environment do

    url="https://api.dribbble.com/v1/shots/?sort=recent&access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"

    response= HTTParty.get(url)
    recent_shots =JSON.parse(response.body)

    recent_shots.each do |s|
      ns= Shot.new
      ns.dribbble.id = s["id"]
      ns.title = s["title"]
      ns.description = s["description"]
      ns.width = s["width"]
      ns.height = s["height"]
      # ns.images.hidpi = s["image"]
      # ns.images.normal = s['image_normal']
      # ns.images.teaser = s["image_teaser"]
      ns.viewcount = s["views_count"]
      ns.likes_count = s['likes_count']
      ns.comments_count = s['comments_count']
      ns.attachments_count = s['attachments_count']
      ns.rebounds_count = s['rebounds_count']
      ns.buckets_count = s['buckets_count']
      # ns.html_url = s['html_url']
      # ns.attatchments_url = s["attatchments_url"]
      # ns.buckets_url = s['buckets_url']
      # ns.comments_url = s['comments_url']
      # ns.likes_url = s['likes_url']
      # ns.projects_url = s['projects_url']
      # ns.animated = s['animated']
      # ns.tags = s['tags']
      # ns.user.id = s['user_id']
      # ns.user.name = s['user_name']
      # ns.user.username = s['user_username']
      # ns.user.html_url = s['user_html_url']
      # ns.user.avatar_url = s['user_avatar_url']
      # ns.user.bio = s['user_bio']
      # ns.user.location = s['user_location']
      # ns.buckets_count = s['buckets_count']
      # ns.comments_received_count = s['comments_received_count']
      # ns.followers_count = s['followers_count']
      # ns.followings_count = s['followings_count']
      # ns.likes_count = s['likes_count']
      # ns.likes_received_count = s['likes_received_count']
      # ns.projects_count = s['projects_count']
      # ns.rebounds_received_count = s['rebounds_received_count']
      # ns.shots_count = s['shots_count']
      # ns.teams_count = s['teams_count']
      # ns.can_upload_shot s['can_upload_shot']
      # ns.type = s['type']
      # ns.pro = s['pro']
      # ns.buckets_url = s['buckets_url']
      # ns.followers_url = s['followers_url']
      # ns.following_url = s['following_url']
      # ns.likes_url = s['likes_url']
      # ns.projects_url = s['projects_url']
      # ns.shots_url = s['shots_url']
      # ns.teams_url = s['teams_url']
      # ns.team = s['team']


      puts ns.inspect

    end


    # s= Shot.new
    # s.title = "test shot"
    # s.save
  # puts "Constructive is getting most recent shots"
  # puts recent_shots

  end

  desc "TODO"
  task get_popular: :environment do
  puts "Constructive is getting most popular shots"
  end

end
