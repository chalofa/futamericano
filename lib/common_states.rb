module CommonStates

  def self.included(base)
    base.class_eval do
      state_machine :state, :initial => :disabled do
        state :active
        state :disabled
        state :pending
        state :finished
        state :deleted

        event :activate do
          transition all => :active
        end

        event :disable do
          transition all => :disabled
        end

        event :finish do
          transition all => :finished
        end

        event :schedule do
          transition all => :pending
        end

        event :soft_delete do
          transition all => :deleted
        end
      end
    end
  end

end
