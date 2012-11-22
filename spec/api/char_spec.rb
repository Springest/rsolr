#encoding: UTF-8

require 'spec_helper'
describe "RSolr::Char" do

  let(:char) { Object.new.extend RSolr::Char }

  it 'should escape everything that is not a word with \\' do
    (0..255).each do |ascii|
      chr = ascii.chr
      esc = char.escape(chr)
      if chr =~ /\W/
        esc.to_s.should == "\\#{chr}"
      else
        esc.to_s.should == chr
      end
    end
  end

  context "utf-8" do
    let(:utf_char) { "ƒ" }
    it "should also work with UTF-8 characters" do
      char.escape(utf_char).should == utf_char
    end
  end
end
