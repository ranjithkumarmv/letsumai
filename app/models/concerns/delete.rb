module Delete
  extend ActiveSupport::Concern

  included do
  scope :without_deleted, ->  { all.where(deleted_at: nil) }
  scope :only_soft_deleted, ->  { all.where.not(deleted_at: nil) }
  scope :softdelete, ->  { update(:deleted_at => Time.now) }
  scope :undosoftdelete, ->  { update(:deleted_at => nil) }
  end

  def getname
    self.class.reflect_on_all_associations(:has_many).first.klass
  end

  def softdelete
    self.update(:deleted_at => Time.now)
    self.getname.update(:deleted_at => Time.now)
  end
  def undosoftdelete
    self.update(:deleted_at => nil)
    self.getname.update(:deleted_at => nil)
  end
end
