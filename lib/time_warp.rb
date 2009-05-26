require 'core_ext'

module TimeWarp
  def pretend_now_is(*args)
    begin
      time_from = (args.size == 1 && args[0].is_a?(Time)) ? args[0] : Time.utc(*args)
      Time.testing_offset = Time.now - time_from
      yield
    ensure
      Time.testing_offset = 0
    end
  end
end

Test::Unit::TestCase.send(:include, TimeWarp)
