#Write a short program that reads its own source code and prints it on the screen.
File.open(__FILE__, "r") {|file| puts file.read}
