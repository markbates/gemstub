require File.dirname(__FILE__) + '/../../spec_helper'

describe Gemstub::Tools::GemGroup do
  
  def numbers
    num = Gemstub::Tools::GemGroup.new(:numbers)
    num.add :one, :version => '1.0.0'
    num.add :two, :version => '2.0.0'
    num.add :three, :version => '3.0.0'
    num
  end
  
  describe 'add' do
    
    it 'should add a gem to its list' do
      pending do
        asdf = Gemstub::Tools::GemGroup.new(:asdf)
        asdf.should have(0).gems
        asdf.add :ppp
        asdf.should have(1).gems
      end
    end
    
    it 'should update an existing gem in its list' do
      pending do
        numbers.get(:one).version.should == '1.0.0'
        numbers.add :one, :version => '1.0.1'
        numbers.get(:one).version.should == '1.0.1'
      end
    end
    
  end
  
  describe 'import' do
    
    it 'should import another list of gems into its list' do
      pending do
        qwerty = Gemstub::Tools::GemGroup.new(:qwerty)
        qwerty.should have(0).gems
        qwerty.import :numbers
        qwerty.should have(3).gems
        qwerty.get(:one).version.should == '1.0.0'
        qwerty.get(:two).version.should == '2.0.0'
        qwerty.get(:three).version.should == '3.0.0'
      end
    end
    
  end
  
  describe 'remove' do
    
    it 'should remove a gem from its list' do
      pending do
        qwerty = manager.group(:qwerty)
        qwerty.should have(0).gems
        qwerty.import :numbers
        qwerty.remove :three
        qwerty.should have(2).gems
        qwerty.get(:one).version.should == '1.0.0'
        qwerty.get(:two).version.should == '2.0.0'
        qwerty.get(:three).should be_nil
      end
    end
    
  end
  
  describe 'get' do
    
    it 'should return a GemObject' do
      pending do
        numbers.get(:one).should be_kind_of(Gemstub::Tools::GemObject)
      end
    end
    
    it 'should return a nil for an unknown gem' do
      numbers.get(:fubar).should be_nil
    end
    
  end
  
end
