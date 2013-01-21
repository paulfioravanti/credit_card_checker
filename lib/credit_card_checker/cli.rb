require 'thor'
require 'credit_card_checker/checker'
require 'credit_card_checker/credit_card'

module CreditCardChecker
  # Command line interface for credit card checker
  class CLI < Thor

    attr_writer   :credit_card_numbers, :output
    attr_accessor :result

    def initialize(*args)
      super(*args)
      @output = []
      @credit_card_numbers =
        File.readlines(options[:filename]).map { |line| line.chomp }
    end

    class_option :filename, aliases: ['-f'],
                  default: 'credit_cards.txt',
                  desc: "name of the file containing credit card numbers",
                  banner: 'FILE'

    desc "check FILE", "checks validity of credit card numbers in a file"
    def check
      checker = Checker.new
      @credit_card_numbers.each do |number|
        @result = checker.check(CreditCard.new(number))
        @output << format_result
      end
      formatted_output
    end

    default_task :check

    no_tasks do

      def format_result
        [
          "#{@result[:cc_type]}:",
          "#{@result[:cc_number]}",
          "(#{@result[:validity]})"
        ]
      end

      def formatted_output
        col_width = @output.transpose.map do |col|
          col.map{ |width| width.to_s.length }.max
        end
        @output.each do |row|
          puts row.zip(col_width).map{ |cell, width|
            cell.to_s.ljust(width) }.join(' ')
        end
      end

    end

  end
end