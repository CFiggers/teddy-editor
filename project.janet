(declare-project 
  :name "teddy"
  :dependencies ["https://www.github.com/CFiggers/janet-termios"])

(declare-executable 
  :name "teddy"
  :entry "src/teddy.janet"
  :install false)