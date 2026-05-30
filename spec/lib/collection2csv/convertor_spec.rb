# frozen_string_literal: true

require "rails_helper"

RSpec.describe Collection2csv::Convertor do
  let(:params) { { klass: "User", ids: User.pluck(:id) } }

  before do
    User.create!(name: "ethiraj")
    User.create!(name: "srinivasan")
  end

  describe "collection without association" do
    it "returns csv" do
      csv_content = content_for_plain_collection("User")
      expect(Collection2csv::Convertor.new(params).perform).to eq csv_content
    end
  end

  describe "collection with association" do
    before do
      Book.create!(name: "Harry Potter", user_id: 1)
      Book.create!(name: "Sherlock homles", user_id: 2)
    end

    let(:params) { { klass: "User", ids: User.pluck(:id), associations: { book: %w[id name] } } }

    it "returns proper header for associations" do
      expect(Collection2csv::Convertor.new(params).perform).to include "Id,Name,CreatedAt,UpdatedAt,BookId,BookName"
    end

    it "returns proper body for associations" do
      first_user, second_user = User.find([1, 2])
      first_user_content = "#{first_user.attributes.values_at(*User.column_names).join(',')},#{first_user.book.id},#{first_user.book.name}"
      second_user_content = "#{second_user.attributes.values_at(*User.column_names).join(',')},#{second_user.book.id},#{second_user.book.name}"
      expect(Collection2csv::Convertor.new(params).perform).to include(first_user_content, second_user_content)
    end
  end
end
