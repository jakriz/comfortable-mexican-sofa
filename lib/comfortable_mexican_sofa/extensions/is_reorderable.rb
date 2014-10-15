module ComfortableMexicanSofa::IsReorderable
  extend ActiveSupport::Concern

  module ClassMethods
    def cms_is_reorderable
      has_one :position,
        :as         => :positioned,
        :class_name => 'Comfy::Cms::Position',
        :dependent  => :destroy,
        :autosave   => true

      before_create :assign_position, :show_me_stuff

      default_scope { joins(:position).order('comfy_cms_positions.position ASC') }
    end
  end

  def assign_position
    site_id = self.try(:site_id)
    max = Comfy::Cms::Position.of_site_and_type(site_id, self.class.name).maximum(:position)
    pos = max ? max + 1 : 0
    build_position(:site_id => site_id, :position => pos)
    true
  end

  def show_me_stuff
    puts self.position.inspect
  end
end

ActiveRecord::Base.send :include, ComfortableMexicanSofa::IsReorderable
