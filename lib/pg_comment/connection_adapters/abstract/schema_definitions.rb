module PgComment
  module ConnectionAdapters
    module SchemaDefinitions
      def self.included(base)
        base::Table.class_eval do
          include PgComment::ConnectionAdapters::Table
        end
      end
    end

    module Table
      extend ActiveSupport::Concern

      # Sets the comment on the table
      #
      # ===== Example
      # ====== Set comment on table
      #   t.set_table_comment 'This table stores phone numbers that conform to the North American Numbering Plan.'
      def set_table_comment(comment)
        @base.set_table_comment(@table_name, comment)
      end

      # Removes any comment from the table
      #
      # ===== Example
      # ====== Remove table comment
      #   t.remove_table_comment
      def remove_table_comment
        @base.remove_table_comment(@table_name)
      end

      # Sets the comment for a given column
      #
      # ===== Example
      # ====== Set comment on the npa column
      #   t.set_column_comment :npa, 'Numbering Plan Area Code - Allowed ranges: [2-9] for first digit, [0-9] for second and third digit.'
      def set_column_comment(column_name, comment)
        @base.set_column_comment(@table_name, column_name, comment)
      end

      # Removes any comment for a given column
      #
      # ===== Example
      # ====== Remove comment from the npa column
      #   t.remove_column_comment :npa
      def remove_column_comment(column_name)
        @base.remove_column_comment(@table_name, column_name)
      end
    end
  end
end