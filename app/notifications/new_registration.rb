# To deliver this notification:
#
# NewRegistration.with(post: @post).deliver_later(current_user)
# NewRegistration.with(registration: @registration).deliver(@registration.activity.user)

class NewRegistration < Noticed::Base
  # Add your delivery methods
  deliver_by :database
  deliver_by :action_cable
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  param :registration

  # Define helper methods to make rendering easier.
  def message
    # t(".message")
    "#{participant.first_name} participe à '#{title}'"
  end

  def url
    user_path(participant)
  end

  def participant
    reg = params[:registration]
    return reg.user
  end

  def title
    reg = params[:registration]
    return reg.activity.title
  end
end
