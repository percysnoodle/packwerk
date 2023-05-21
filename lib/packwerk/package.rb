# typed: strict
# frozen_string_literal: true

module Packwerk
  # The basic unit of modularity for packwerk; a folder that has been declared to define a package.
  # The package contains all constants defined in files in this folder and all subfolders that are not packages
  # themselves.
  class Package
    extend T::Sig
    include Comparable

    ROOT_PACKAGE_NAME = "."
    DEFAULT_TEST_GLOBS = T.let(["test/**.rb", "spec/**.rb"], T::Array[String])

    sig { returns(String) }
    attr_reader :name

    sig { returns(T::Array[String]) }
    attr_reader :dependencies

    sig { returns(T::Array[String]) }
    attr_reader :test_dependencies

    sig { returns(T::Array[String]) }
    attr_reader :test_files

    sig { returns(T::Hash[T.untyped, T.untyped]) }
    attr_reader :config

    sig { params(name: String, config: T.nilable(T::Hash[String, T.untyped])).void }
    def initialize(name:, config: nil)
      @name = name
      @config = T.let(config || {}, T::Hash[String, T.untyped])
      @dependencies = T.let(Array(@config["dependencies"]).freeze, T::Array[String])
      @test_dependencies = T.let(Array(@config["test_dependencies"]).freeze, T::Array[String])
      @test_files = T.let(@config["test_files"] || DEFAULT_TEST_GLOBS, T::Array[String])
      @public_path = T.let(nil, T.nilable(String))
    end

    sig { returns(T::Boolean) }
    def enforce_dependencies?
      [true, "strict"].include?(@config["enforce_dependencies"])
    end

    sig { params(package: Package).returns(T::Boolean) }
    def dependency?(package)
      @dependencies.include?(package.name)
    end

    sig { params(package: Package).returns(T::Boolean) }
    def test_dependency?(package)
      @test_dependencies.include?(package.name)
    end

    sig { params(filename: String).returns(T::Boolean) }
    def test_file?(filename)
      test_files.any? do |glob|
        File.fnmatch?(glob, filename)
      end
    end

    sig { params(path: String).returns(T::Boolean) }
    def package_path?(path)
      return true if root?

      path.start_with?(@name)
    end

    sig { params(other: T.untyped).returns(T.nilable(Integer)) }
    def <=>(other)
      return nil unless other.is_a?(self.class)

      name <=> other.name
    end

    sig { params(other: T.untyped).returns(T::Boolean) }
    def eql?(other)
      self == other
    end

    sig { returns(Integer) }
    def hash
      name.hash
    end

    sig { returns(String) }
    def to_s
      name
    end

    sig { returns(T::Boolean) }
    def root?
      @name == ROOT_PACKAGE_NAME
    end
  end
end
