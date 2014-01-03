require 'rake/tasklib'

module YARD
  module Bond
    class Task < ::Rake::TaskLib

      COMPLETIONS_DIR = 'lib/bond/completions'

      def initialize(name,options={})
        @name = name
        @path = File.join(COMPLETIONS_DIR,"#{@name}.rb")

        define
      end

      protected

      def define
        file @path => YARD::Registry.yardoc_file do
          FileUtils.mkdir_p File.dirname(@path)

          YARD::Registry.load!

          File.open(@path,'w') do |file|
            YARD::Registry.all(:method).each do |m|
              if m.tags.any? { |tag| tag.kind_of?(YARD::Tags::OptionTag) }
                paths   = method_paths(m)
                options = m.tags.select { |tag|
                  tag.kind_of?(YARD::Tags::OptionTag)
                }.map { |tag| option_tag_to_hash_key(tag) }

                file.puts "Bond.complete(:methods => #{paths.inspect}) { #{options.inspect} }"
              end
            end
          end
        end
      end

      private

      def method_path(method)
        method.path.sub(/#initialize$/,'.new')
      end

      def method_paths(method)
        [method_path(method)] + method.aliases.map { |a| method_path(a) }
      end

      def option_tag_to_hash_key(tag)
        name = tag.pair.name

        if name.start_with?(':') then "#{name[1..-1]}: "
        else                          "#{name.inspect} => "
        end
      end
    end
  end
end
