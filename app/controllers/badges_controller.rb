class BadgesController < ApplicationController

  def create
    friend = User.find params[:friend_id], :select => "image_thumb, permalink, name, id, facebook_uid"
    badge = Badge.new_badge(params[:id], friend, current_user)
    message = "#{current_user.name} gave a card to #{friend.name} saying #{badge.data[:badge_name]}"
            
    render :update do |page|
      page.hide "card_#{params[:id]}"
      page.insert_html :top, 'profile_cards_wrap', :partial => 'badges/card', :locals => { :card => badge }
      publish_to_fb(page, friend, message)
    end  
  end

  def show
    if current_user.badges_given.nil?
      cards = Badge.all :conditions => ["giveable = ?", true]
    else
      cards = Badge.all :conditions => ["giveable = ? and id NOT IN (?)", true, current_user.badges_given]
      cards_given = Badge.all :conditions => ["giveable = ? and id IN (?)", true, current_user.badges_given]
      
    end
    render :update do |page|
      page.replace_html "card_frame", :partial => 'badges/card_frame', :locals => { :cards => cards, :cards_given => cards_given, :user => current_user.id, :friend => params[:id] }
    end
  end
end
