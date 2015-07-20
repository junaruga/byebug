require 'byebug/command'

module Byebug
  #
  # Interrupting execution of current thread.
  #
  class InterruptCommand < Command
    self.allow_in_control = true
    self.allow_in_post_mortem = false

    def regexp
      /^\s*i(?:nterrupt)?\s*$/
    end

    def description
      <<-EOD
        i[nterrupt]

        #{short_description}
      EOD
    end

    def short_description
      'Interrupts the program'
    end

    def execute
      Byebug.thread_context(Thread.main).interrupt
    end
  end
end
