require 'test_helper'

  class ResumeTest < ActiveSupport::TestCase
  def setup
    @resume = Resume.new(name: 'teste', attachment: 'dados.txt')    
  end
  
  test 'valid resume' do
    refute @resume.valid?, 'resumo com nome e anexo'
  end
  
  test 'invalid without name' do
    @resume = Resume.new(attachment: 'data.txt')
    refute @resume.valid?, 'resumo valido sem o anexo'
    assert_not_nil @resume.errors[:name], 'sem validacao de erro para obrigatoriedade de nome'
  end
  
  test 'invalide without attachment' do
    @resume = Resume.new(name: 'teste')
    refute @resume.valid?, 'resumo valido sem anexo'
    assert_not_nil @resume.errors[:attachment], 'sem validacao de erro para obrigatoriedade de anexo'
  end


end
