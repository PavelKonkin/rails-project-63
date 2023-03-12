#  Module for tag generation
module Tag
    def build(tag, **args)
      single_tags = %w[br image input]
      double_tags = %w[label div form]
      attr = ""
      args.each do |key, value|
        attr = "#{attr} #{key}=\"#{value}\""
      end
      body = (yield if block_given?).to_s
      return "<#{tag}#{attr}>" if single_tags.include? tag

      return "<#{tag}#{attr}>#{body}</#{tag}>" if double_tags.include? tag
    end
end