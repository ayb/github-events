module ApplicationHelper

  def error_summary(obj)
    out = []
    obj.errors.messages.each do |field, errors|
      errors.each do |error|
        out.push("#{field.capitalize} #{error}")
      end
    end
    out.join(", ")
  end

end
