# To deliver this notification:
#
# NewActivity.with(post: @post).deliver_later(current_user)
# NewActivity.with(post: @post).deliver(current_user)

class NewActivity < Noticed::Base
  # Add your delivery methods
  deliver_by :database
  deliver_by :action_cable
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  param :activity

  # Define helper methods to make rendering easier.
  def message
    # t(".message")
    "#{creator.first_name} propose une nouvelle activité : '#{title}'"
  end

  def url
    activity_path(params[:activity])
  end

  def creator
    activity = params[:activity]
    return activity.user
  end

  def title
    activity = params[:activity]
    return activity.title
  end
end
