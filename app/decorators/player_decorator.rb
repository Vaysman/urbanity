class PlayerDecorator < Draper::Decorator
  delegate_all

  def full_name
    if (first_name.blank? && last_name.blank?)
      "Nemo"
    else
      "#{first_name} #{last_name}"
    end
  end

  def nick_name
    if(nick.blank?)
      "Anonymous"
    else
      nick
    end
  end

  def bio
    if(object.bio.blank?)
      "There is no such information"
    else
      object.bio
    end
  end

  def email
    user.email
  end
end
