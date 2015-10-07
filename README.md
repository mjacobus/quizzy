Quizzy
----------------------

[![Build Status](https://travis-ci.org/mjacobus/quizzy.svg)](https://travis-ci.org/mjacobus/quizzy)
[![Coverage Status](https://coveralls.io/repos/mjacobus/quizzy/badge.svg?branch=master&service=github)](https://coveralls.io/github/mjacobus/quizzy?branch=master)
[![Code Coverage](https://scrutinizer-ci.com/g/mjacobus/quizzy/badges/coverage.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/quizzy/?branch=master)
[![Code Climate](https://codeclimate.com/github/mjacobus/quizzy/badges/gpa.svg)](https://codeclimate.com/github/mjacobus/quizzy)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/mjacobus/quizzy/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/quizzy/?branch=master)
[![Dependency Status](https://gemnasium.com/mjacobus/quizzy.svg)](https://gemnasium.com/mjacobus/quizzy)

## Features

- As an user I want to create quizzes
- A quiz can be public or private
- For every quiz I want to create items
- A quiz item has
  - hint [optional]
  - question
  - answer
- A public quiz can be taken by its owner or by other users, when public
- A private quiz can be taken by whoever the owner allows
- A quiz has a rank
  - a rank score is the percentage of correct answers
- A user can tweet a quiz score
- Users use social login
  - google
  - facebook
  - twitter
  - github


## TODO
- [Next features](https://github.com/mjacobus/quizzy/issues?labels=enhancement&page=1&state=open)
- [Issues](https://github.com/mjacobus/quizzy/issues?state=open)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

** Do not forget to write tests**

### Running tests

```bash
bundle exec rake test
```

## Authors

- [Marcelo Jacobus](https://github.com/mjacobus)
