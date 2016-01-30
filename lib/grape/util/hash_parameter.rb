require 'active_support/concern'
module Grape
  module Util
    module HashParameter
      extend ActiveSupport::Concern

      def deem_hash_array?(hash)
        unless hash.present?
          return false
        end

        hash.keys.each do |key|
          unless integer_string?(key)
            return false
          end
        end
        true
      end

      def integer_string?(str)
        Integer(str)
        true
      rescue ArgumentError, TypeError
        false
      end
    end
  end
end

