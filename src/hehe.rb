#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "./blowfish"
require "base64"

module Hehe

  def self.print_usage
    puts "Simple Usage:"
    puts "hehe <passphrase> <password>"
    puts "hehe <passphrase> <file_name>"
  end

  def self.encrypt_string(passphrase, password)
    puts "hehe" + Base64.encode64(Blowfish.encrypt(passphrase, password)).gsub("\n","") + "hehe"
  end
  
  def self.decrypt_file(passphrase, file_name)
    hehe_file = File.open(file_name, "r")
    origin_file = File.open(file_name.gsub(".hehe", ""), "w")

    encrypted_content = hehe_file.read
    strings = encrypted_content.split "hehe"
    decrypted_password =  strings[1]
    
    origin_password = Blowfish.decrypt(passphrase, Base64.decode64(decrypted_password))
    origin_content = encrypted_content.gsub("hehe"+decrypted_password+"hehe", origin_password)
    origin_file.write origin_content

    hehe_file.close
    origin_file.close
  end

end


if __FILE__ == $0
  if ARGV.length != 2
    Hehe.print_usage
    exit
  end

  passphrase = ARGV[0]
  password_or_file = ARGV[1]
  if password_or_file.end_with? ".hehe"
    Hehe.decrypt_file(passphrase, password_or_file)
  else
    Hehe.encrypt_string(passphrase, password_or_file)
  end
end

