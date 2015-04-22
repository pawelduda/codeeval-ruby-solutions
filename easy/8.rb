# https://www.codeeval.com/browse/8/

def reverse_words(str)
  str.split(' ').reverse.join(' ')
end

p reverse_words('Hello world')