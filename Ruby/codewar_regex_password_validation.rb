# 5 kyu Regux Password Validation

# You need to write regex that will validate a password to make sure it meets the following criteria:

# At least six characters long
# contains a lowercase letter
# contains an uppercase letter
# contains a number
# Valid passwords will only be alphanumeric characters.

# ################

# (?=.*\d) #  must contains one digit from 0-9

# Ans1 fail with 'fjd3IR9.;'
regex = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}/
# Ans1.1 pass, but not good enough
regex = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/


##################



regex = /(a-z)+(A-Z)+(\d)+{6,}/

p regex=~'fjd3IR9' # true)
p regex=~'ghdfj32' # false)
p regex=~'DSJKHD23' # false)
p regex=~'dsF43' # false)
p regex=~'4fdg5Fj3' # true)
p regex=~'DHSJdhjsU' # false)
p regex=~'fjd3IR9.;' # false)
p regex=~'fjd3  IR9' # false)
p regex=~'djI38D55' # true)
p regex=~'a2.d412' # false)
p regex=~'JHD5FJ53' # false)
p regex=~'!fdjn345' # false)
p regex=~'jfkdfj3j' # false)
p regex=~'123' # false)
p regex=~'abc' # false)
p regex=~'123abcABC' # true)
p regex=~'ABC123abc' # true)
p regex=~'Password123' # true)

# fjd3IR9
# ghdfj32
# DSJKHD23
# dsF43
# 4fdg5Fj3
# DHSJdhjsU
# fjd3IR9.;
# fjd3  IR9
# djI38D55
# a2.d412
# JHD5FJ53
# !fdjn345
# jfkdfj3j
# 123
# abc
# 123abcABC
# ABC123abc
# Password123