module ApplicationHelper
  def bootstrop_context_label_for(type)
    case type
    when 'notice' then 'success'
    when 'alert' then 'danger'
    end
  end
end
