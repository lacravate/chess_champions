# Find the champions

## Install
- git clone the repo
- you need Ruby 3

Then :
```
bundle install
```

Then :
```
ruby chess_champion.rb 100 # 100 being the number of players you want to generate randomly
                           # can be what you want
                           # may consider redirect output to file for large numbers
                           # ruby chess_champion.rb 10000 > champs.txt
```

If no number is given, it will load the source and exit, but that's what you want if you are playing with this in irb console.

## Tests

One example :
```
rspec
```
