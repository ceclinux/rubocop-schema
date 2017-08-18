# frozen_string_literal: true
module RuboCop
  module Cop
    module Style

      class SchemaComments < Cop
        include ConfigurableEnforcedStyle

        MSG = 'Comment is obligatory.'.freeze
        COMMON_DB_FIELDS = %w("deleted_at" "id" "creator_id" "deleter_id" "created_at" "updated_at").freeze

        def on_block(node)
          node.body.each_child_node do |table|
            # skip add_foreign_key, add_index
            if table.type == :block && table.send_node.source.start_with?("create_table")
              table.body.each_child_node do |ancestor|
                process_block_child_node(ancestor)
              end
            end
          end
        end

        private

        def process_block_child_node(ancestor)

          field_name = ancestor.children[2].source
          return if COMMON_DB_FIELDS.include? field_name

          last_child = ancestor.children[-1]
          return if last_child.type == :hash && last_child.each_key.any? {|key| key.source == "comment"}

          add_offense(ancestor, :expression)
        end
      end
    end
  end
end
