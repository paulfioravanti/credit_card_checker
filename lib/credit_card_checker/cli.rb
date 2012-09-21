require 'thor'
require 'credit_card_checker/checker'
require 'credit_card_checker/credit_card'

module CreditCardChecker
  class CLI < Thor

    attr_writer :credit_card_numbers, :output

    class_option :filename, aliases: ['-f'],
                  default: 'credit_cards.txt',
                  desc: "name of the file containing credit card numbers",
                  banner: 'FILE'

    desc "check FILE", "checks validity of credit card numbers in a file"
    def check
      checker = Checker.new
      credit_card_numbers.each do |number|
        checker.check(CreditCard.new(number))
        output << format(checker.result)
      end
      formatted_output
    end

    default_task :check

    no_tasks do

      def credit_card_numbers
        @credit_card_numbers ||=
          File.readlines(options[:filename]).map { |a| a.chomp }
      end

      def output
        @output ||= []
      end

      def format(output)
        [
          "#{output[:cc_type]}:",
          "#{output[:cc_number]}",
          "(#{output[:validity]})"
        ]
      end

      def formatted_output
        col_width = output.transpose.map do |col|
          col.map{ |cell| cell.to_s.length }.max
        end
        output.each do |row|
          puts row.zip(col_width).map{ |cell, w| cell.to_s.ljust(w) }.join(' ')
        end
      end

    end

  end
end