#--------------------------------------------------------------------
#   Common Model finders
#--------------------------------------------------------------------

module CommonFinders

  def self.included(base)
    base.class_eval do
      class << self

        def next_pending
          pending.first
        end

      end
    end
  end

end
