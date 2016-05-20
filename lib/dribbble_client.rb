
class DribbbleClient
  def get_shots
    s= HTTParty.get "https://api.dribbble.com/v1/shots/?sort=recent&access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"

    j = JSON.parse(s)
    return j

  end
end
