namespace :dribbble do
  desc "TODO"
  task get_recent: :environment do

    url="https://api.dribbble.com/v1/shots/?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"

    response= HTTParty.get(url)
    recent_shots =JSON.parse(response.body)

    recent_shots.each do |s|
      users_dribbbleid = s['user']['id']

      existing_user = User.where(designer_id: users_dribbbleid)

      if existing_user.empty?
        user = User.create(
        designer_id: s['user']['id'],
        designer_full_name: s['user']['name'],
        designer_username: s['user']['username'],
        designer_home_url: s['user']['html_url'],
        designer_avatar_url: s['user']['avatar_url'],
        designer_bio: s['user']['bio'],
        designer_location: s['user']['location'],
        designer_bk_count: s['user']['buckets_count'],
        designer_comments_received_count: s['user']['comments_received_count'],
        designer_follower_count: s['user']['followers_count'],
        designer_is_following_count: s['user']['followings_count'],
        designer_made_likes_count: s['user']['likes_count'],
        designer_received_likes_count: s['user']['likes_received_count'],
        designer_project_count: s['user']['projects_count'],
        designer_rebounds_received_count: s['user']['rebounds_received_count'],
        designer_added_shots_count: s['user']['shots_count'],
        designer_list_of_followers_url: s['user']['followers_url'],
        designer_following_list_url: s['user']['following_url'],
        designer_list_of_shots_url: s['shots_url']
        )
        newshot = Shot.create(
          dribbble_id: s["id"],
          title: s["title"],
          description: s["description"],
          width: s["width"],
          height: s["height"],
          images_hidpi: s["images"]["hidpi"],
          images_normal: s["images"]["normal"],
          images_teaser: s["images"]["teaser"],
          viewcount: s["views_count"],
          likes_count: s['likes_count'],
          comments_count: s['comments_count'],
          attachments_count: s['attachments_count'],
          rebounds_count: s['rebounds_count'],
          buckets_count: s['buckets_count'],
          html_url: s['html_url'],
          attachments_url: s["attatchments_url"],
          buckets_url: s['buckets_url'],
          comments_url: s['comments_url'],
          likes_url: s['likes_url'],
          projects_url: s['projects_url'],
          animated: s['animated'],
          tags: s['tags'],
          user_id: user.id,
          )

        else
          user = existing_user.first

          newshot = Shot.create(
            dribbble_id: s["id"],
            title: s["title"],
            description: s["description"],
            width: s["width"],
            height: s["height"],
            images_hidpi: s["images"]["hidpi"],
            images_normal: s["images"]["normal"],
            images_teaser: s["images"]["teaser"],
            viewcount: s["views_count"],
            likes_count: s['likes_count'],
            comments_count: s['comments_count'],
            attachments_count: s['attachments_count'],
            rebounds_count: s['rebounds_count'],
            buckets_count: s['buckets_count'],
            html_url: s['html_url'],
            attachments_url: s["attatchments_url"],
            buckets_url: s['buckets_url'],
            comments_url: s['comments_url'],
            likes_url: s['likes_url'],
            projects_url: s['projects_url'],
            animated: s['animated'],
            tags: s['tags'],
            user_id: user.id)


            response = HTTParty.get(s['comments_url']+"?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03")
            comments = JSON.parse(response.body)

            comments.each do |c|
              nc= Comment.create(
              comment_id: c["id"].to_s,
              comment_created_at: c["created_at"],
              body: c["body"],
              user_avatar_url: c["user"]["avatar_url"],
              user_id: c["user"]["id"],
              user_name: c['user']['name'])

            end


        end
    end
end
end




  # desc "TODO"
  # task get_popular: :environment do
  #   url="https://api.dribbble.com/v1/shots/?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"
  #
  #   response= HTTParty.get(url)
  #   recent_shots =JSON.parse(response.body)
  #
  #   recent_shots.each do |s|
  #     ns= Shot.new
  #     ns.dribbble_id = s["id"]
  #     ns.title = s["title"]
  #     ns.description = s["description"]
  #     ns.width = s["width"]
  #     ns.height = s["height"]
  #     ns.images_hidpi = s["images"]["hidpi"]
  #     ns.images_normal = s["images"]["normal"]
  #     ns.images_teaser = s["images"]["teaser"]
  #     ns.viewcount = s["views_count"]
  #     ns.likes_count = s['likes_count']
  #     ns.comments_count = s['comments_count']
  #     ns.attachments_count = s['attachments_count']
  #     ns.rebounds_count = s['rebounds_count']
  #     ns.buckets_count = s['buckets_count']
  #     ns.html_url = s['html_url']
  #     ns.attachments_url = s["attatchments_url"]
  #     ns.buckets_url = s['buckets_url']
  #     ns.comments_url = s['comments_url']
  #     ns.likes_url = s['likes_url']
  #     ns.projects_url = s['projects_url']
  #     ns.animated = s['animated']
  #     ns.tags = s['tags']
  #     ns.user_id = s['user']['id']
  #     ns.user_name = s['user']['name']
  #     ns.user_username = s['user']['username']
  #     ns.user_html_url = s['user']['html_url']
  #     ns.user_avatar_url = s['user']['avatar_url']
  #     ns.user_bio = s['user']['bio']
  #     ns.user_location = s['user']['location']
  #     ns.buckets_count = s['user']['buckets_count']
  #     ns.comments_received_count = s['user']['comments_received_count']
  #     ns.followers_count = s['user']['followers_count']
  #     ns.followings_count = s['user']['followings_count']
  #     ns.likes_count = s['user']['likes_count']
  #     ns.likes_received_count = s['user']['likes_received_count']
  #     ns.projects_count = s['user']['projects_count']
  #     ns.rebounds_received_count = s['user']['rebounds_received_count']
  #     ns.shots_count = s['user']['shots_count']
  #     ns.teams_count = s['user']['teams_count']
  #     ns.can_upload_shot = s['user']['can_upload_shot']
  #     ns.dribbble_type = s['user']['type']
  #     ns.pro = s['user']['pro']
  #     ns.followers_url = s['user']['followers_url']
  #     ns.following_url = s['user']['following_url']
  #     ns.shots_url = s['shots_url']
  #     ns.teams_url = s['teams_url']
  #     ns.team = s['user']['team']
  #
  #     ns.save
  #   end
  #
  # end

#   desc "TODO"
#   task get_popular: :environment do
#     url="https://api.dribbble.com/v1/shots/?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"
#     response= HTTParty.get(url)
#     recent_shots =JSON.parse(response.body)
#
#     recent_shots.each do |s|
#       ns= Shot.new
#       ns.dribbble_id = s["id"]
#       ns.title = s["title"]
#       ns.description = s["description"]
#       ns.width = s["width"]
#       ns.height = s["height"]
#       ns.images_hidpi = s["images"]["hidpi"]
#       ns.images_normal = s["images"]["normal"]
#       ns.images_teaser = s["images"]["teaser"]
#       ns.viewcount = s["views_count"]
#       ns.likes_count = s['likes_count']
#       ns.comments_count = s['comments_count']
#       ns.attachments_count = s['attachments_count']
#       ns.rebounds_count = s['rebounds_count']
#       ns.buckets_count = s['buckets_count']
#       ns.html_url = s['html_url']
#       ns.attachments_url = s["attatchments_url"]
#       ns.buckets_url = s['buckets_url']
#       ns.comments_url = s['comments_url']
#       ns.likes_url = s['likes_url']
#       ns.projects_url = s['projects_url']
#       ns.animated = s['animated']
#       ns.tags = s['tags']
#       ns.user_id = s['user']['id']
#       ns.user_name = s['user']['name']
#       ns.user_username = s['user']['username']
#       ns.user_html_url = s['user']['html_url']
#       ns.user_avatar_url = s['user']['avatar_url']
#       ns.user_bio = s['user']['bio']
#       ns.user_location = s['user']['location']
#       ns.buckets_count = s['user']['buckets_count']
#       ns.comments_received_count = s['user']['comments_received_count']
#       ns.followers_count = s['user']['followers_count']
#       ns.followings_count = s['user']['followings_count']
#       ns.likes_count = s['user']['likes_count']
#       ns.likes_received_count = s['user']['likes_received_count']
#       ns.projects_count = s['user']['projects_count']
#       ns.rebounds_received_count = s['user']['rebounds_received_count']
#       ns.shots_count = s['user']['shots_count']
#       ns.teams_count = s['user']['teams_count']
#       ns.can_upload_shot = s['user']['can_upload_shot']
#       ns.dribbble_type = s['user']['type']
#       ns.pro = s['user']['pro']
#       ns.followers_url = s['user']['followers_url']
#       ns.following_url = s['user']['following_url']
#       ns.shots_url = s['shots_url']
#       ns.teams_url = s['teams_url']
#       ns.team = s['user']['team']
#
#       response = HTTParty.get(ns.comments_url+"?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03")
#       recent_comments = JSON.parse(response.body)
#
#
#       recent_comments.each do |c|
#         nc= Comment.new
#
#         nc.comment_id = c["id"].to_s
#         nc.comment_created_at = c["created_at"]
#         nc.body = c["body"]
#         nc.user_avatar_url = c["user"]["avatar_url"]
#         nc.user_id = c["user"]["id"]
#         nc.user_name = c['user']['name']
#         puts nc.inspect
#       end
#
#       #   response = HTTParty.get(ns.buckets_url+"?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03")
#       #   recent_buckets = JSON.parse(response.body)
#       #
#       #   nc= Bucket.new
#       #   nc.comment_id = s["id"]
#       #   nc.comment_created_at = s["created_at"]
#       #   nc.body = s["body"]
#       #   nc.user_avatar_url = s["user"]["avatar_url"]
#       #   nc.user_id = s["user"]["id"]
#       #   nc.user_name = s['user']['name']
#       #
#       # puts nc.inspect
#
#
#   end
# end
#
# end
#
#
#

  # desc "TODO"
  # task get_comment: :environment do
  #   url="https://api.dribbble.com/v1/shots/?sort=comments&access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"
  #
  #
  #
  #   recent_shots.each do |s|
  #
  #
  # end
