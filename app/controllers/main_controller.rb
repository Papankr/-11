# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @last_ticket = Ticket.last
  end

  def tickets
    @tickets = Ticket.all
    render xml: @tickets.as_json.to_xml
  end

  def check
    unless num = params[:number] then num = '' end
    @ticket = Ticket.find_or_initialize_by(number: num)
    if @ticket.new_record?
      calc num
      @ticket.result = @result.map { |x| x + ['*'] }.join ' '
      @ticket.number = num
      @ticket.maxlen = @maxlen
      @ticket.save
    else
      cra = []
      fa = []
      @maxlen = @ticket.maxlen
      @ticket = @ticket.result.split
      @ticket.each { |x| x == '*' ? fa << cra; cra = [] : cra << x }
      @result = fa
    end
    end

  def calc(stroka)
    kr5 = ->(x) { Math.sqrt(x).to_i**2 == x }
    stroka = stroka.split.push('7').map(&:to_i)
    flag = false
   fa = []
   cra = []
    stroka.each do |cr|
      if flag && kr5.call(cr) then cra << cr
      elsif !flag && kr5.call(cr) then fa << cra; flag = true; cra = []; cra << cr
      elsif flag && !(kr5.call cr) then fa << cra; flag = false; cra = [] end
    end
    @result = fa.reject { |x| x.empty? }
    @maxlen = fa != [] ? fa.max_by(&:size).size : 0
  end
end
