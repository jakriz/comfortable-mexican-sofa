class Comfy::Cms::Position < ActiveRecord::Base
  self.table_name = 'comfy_cms_positions'

  # -- Relationships --------------------------------------------------------
  belongs_to :site
  belongs_to :positioned,
    :polymorphic => true

  # -- Validations ----------------------------------------------------------
  validates :site_id,
    :presence   => true
  validates :positioned_type,
    :presence   => true
  validates :positioned_id,
    :presence   => true
  validates :position,
    :presence   => true

  # -- Scopes ---------------------------------------------------------------
  scope :of_site_and_type, lambda { |site_id, type|
    where(:site_id => site_id, :positioned_type => type)
  }

end
