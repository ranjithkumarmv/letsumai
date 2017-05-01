module Delete
  extend ActiveSupport::Concern

  included do
  scope :without_deleted, ->  { all.where(deleted_at: nil) }
  scope :only_soft_deleted, ->  { all.where.not(deleted_at: nil) }
  scope :softdelete, ->  { update(:deleted_at => Time.now) }
  scope :undosoftdelete, ->  { update(:deleted_at => nil) }
  end

  def softdelete
    self.update(:deleted_at => Time.now)
  end
  def undosoftdelete
    self.update(:deleted_at => nil)
  end
end
