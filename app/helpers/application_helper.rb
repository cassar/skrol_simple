module ApplicationHelper
  def bootstrop_context_label_for(type)
    case type
    when 'notice' then 'primary'
    when 'alert' then 'danger'
    end
  end
end
