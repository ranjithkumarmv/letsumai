module Delete
  extend ActiveSupport::Concern

  included do
    has_many :addresses
  end

  def softdelete
    update(:deleted_at => Time.now)
    self.addresses.update(:deleted_at => Time.now)
  end
  def undosoftdelete
    update(:deleted_at => nil)
    self.addresses.update(:deleted_at => nil)
  end
end
