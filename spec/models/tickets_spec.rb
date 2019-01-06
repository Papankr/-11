# frozen_string_literal: true

require 'rails_helper'

describe Ticket do
  it 'create a ticket' do
    before_count = Ticket.count
    Ticket.create(number: '9')
    expect(Ticket.count).not_to eq(before_count)
  end

  it 'find created ticket' do
    Ticket.create(number: '9')
    expect(Ticket.find_by(number: '9')).to be_present
  end

  it "doesn't create new ticket with same number" do
    Ticket.create(number: '9')
    second_ticket = Ticket.create(number: '9')
    expect(second_ticket.errors[:number]).to include('has already been taken')
  end
end
