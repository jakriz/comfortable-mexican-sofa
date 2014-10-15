class Comfy::Admin::Cms::PositionsController < Comfy::Admin::Cms::BaseController

  def reorder
    model_name = params[:model_name] || ''
    puts model_name
    (params[model_name.underscore.to_sym] || []).each_with_index do |id, index|
      record = Comfy::Cms::Position.find_by(:positioned_type => model_name, :positioned_id => id)
      record.update_attribute(:position, index) unless record.nil?
    end
    render :nothing => true
  end

end
