# Checksum

Checksum generating rules:
  * Remove any character that is not in the English ABC
  * Create words which are 10 characters long, by joining the words
      eg: foo bar baz wibble fizzbuzz fizz buzz -> foobarbazw ibblefizzb uzzfizzbuz z
  * Capitalize each word 
  * Upcase any vowel that is after two consonants and previous vowel is upcase.
      eg: Foobarbazw Ibblefizzb Uzzfizzbuz Z -> Foobarbazw IbblEfizzb UzzfIzzbUz Z
  * Checksum contains:
      - Count of original words (7)
      - Count of newly created words (4)
      - Count of upper case vowels (5)
      - Count of consonants (21)
      - Length of original string (37)
      eg: 7-4-5-21-37
 
Examples: (input -> output)
  foo bar baz wibble fizzbuzz fizz buzz -> 7-4-5-21-37
  The quick brown fox jumps over the lazy dog -> 9-4-3-24-43
