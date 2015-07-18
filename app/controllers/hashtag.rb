get '/hashtag/:id' do
  @tag = Hashtag.find(params[:id])
  @bites_for_tag = @tag.bites

  erb :'hashtags/show'
end