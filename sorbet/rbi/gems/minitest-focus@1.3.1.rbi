# typed: false

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `minitest-focus` gem.
# Please instead update this file by running `bin/tapioca gem minitest-focus`.

# source://minitest-focus-1.3.1/lib/minitest/focus.rb:3
class Minitest::Test < ::Minitest::Runnable
  include ::Mocha::ParameterMatchers
  include ::Mocha::Hooks
  include ::Mocha::API

  # source://minitest-5.16.2/lib/minitest/test.rb:194
  def capture_exceptions; end

  # source://minitest-5.16.2/lib/minitest/test.rb:15
  def class_name; end

  # source://minitest-5.16.2/lib/minitest/test.rb:211
  def neuter_exception(e); end

  # source://minitest-5.16.2/lib/minitest/test.rb:222
  def new_exception(klass, msg, bt, kill = T.unsafe(nil)); end

  # source://minitest-5.16.2/lib/minitest/test.rb:92
  def run; end

  # source://minitest-5.16.2/lib/minitest/test.rb:204
  def sanitize_exception(e); end

  # source://minitest-5.16.2/lib/minitest/test.rb:236
  def with_info_handler(&block); end

  class << self
    # source://minitest-focus-1.3.1/lib/minitest/focus.rb:10
    def add_to_filter(name); end

    # source://minitest-focus-1.3.1/lib/minitest/focus.rb:14
    def filtered_names; end

    # Focus on the next test defined. Cumulative. Equivalent to
    # running with command line arg: -n /test_name|.../
    #
    #   class MyTest < Minitest::Test
    #
    #     # direct approach
    #     focus def test_method1 # will run
    #       ...
    #     end
    #
    #     # indirect approach
    #     focus
    #     def test_method2       # will run
    #       ...
    #     end
    #
    #     def test_method3       # will NOT run
    #       ...
    #     end
    #   end
    #
    # source://minitest-focus-1.3.1/lib/minitest/focus.rb:40
    def focus(name = T.unsafe(nil)); end

    # source://minitest-5.16.2/lib/minitest/test.rb:31
    def i_suck_and_my_tests_are_order_dependent!; end

    # source://minitest-5.16.2/lib/minitest/test.rb:22
    def io_lock; end

    # source://minitest-5.16.2/lib/minitest/test.rb:22
    def io_lock=(_arg0); end

    # source://minitest-5.16.2/lib/minitest/test.rb:44
    def make_my_diffs_pretty!; end

    # source://minitest-5.16.2/lib/minitest/test.rb:55
    def parallelize_me!; end

    # source://minitest-5.16.2/lib/minitest/test.rb:65
    def runnable_methods; end

    # Sets a one-off method_added callback to set focus on the method
    # defined next.
    #
    # source://minitest-focus-1.3.1/lib/minitest/focus.rb:52
    def set_focus_trap; end

    # source://minitest-5.16.2/lib/minitest/test.rb:83
    def test_order; end
  end
end

# source://minitest-focus-1.3.1/lib/minitest/focus.rb:4
class Minitest::Test::Focus; end

# source://minitest-focus-1.3.1/lib/minitest/focus.rb:5
Minitest::Test::Focus::VERSION = T.let(T.unsafe(nil), String)

# source://minitest-5.16.2/lib/minitest/test.rb:19
Minitest::Test::PASSTHROUGH_EXCEPTIONS = T.let(T.unsafe(nil), Array)

# source://minitest-5.16.2/lib/minitest/test.rb:87
Minitest::Test::TEARDOWN_METHODS = T.let(T.unsafe(nil), Array)