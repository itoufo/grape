require 'active_support/concern'
module Grape
  module Util
    module HashParameter
      extend ActiveSupport::Concern

      def deem_hash_array?(hash)
        return false unless hash.present?

        hash.keys.each do |key|
          return false unless integer_string?(key)
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
