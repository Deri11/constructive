class HomeController < ApplicationController

  def index
    @shots = Shot.all
  end


end

#   <ul>
#     <% @shots.each do |s| %>
#       <li><img src='<%#=s.(id: 2434).images_normal%>'></li>
#     <%end%>
#   </ul>
#
#
# <h1> this is the example </h1>
# <img src='<%#= @shots.select {|s| (s.id==2434).images_normal } %>'>
