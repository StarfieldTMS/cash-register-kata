Cash Register Kata
------------------

Register is a class that represents the cash register at a
grocery store. It can be used to ring up a number of items and then display the
running total. Here are the items the store sells and their prices:

    | Item Name                    | Price                                  |
    |------------------------------|----------------------------------------|
    | Frozen Pizza                 | $5.00                                  |
    | Corn                         | $0.50 or 5 for $2.00                   |
    | Ground Beef                  | $4.99/lb (partial pounds allowed)      |
    | Vanilla Mayfield Ice Cream   | $5.99                                  |
    | Chocolate Mayfield Ice Cream | $5.99 (Buy 1 get 1 Free on Wednesdays) |
    | Mango                        | $1.00 ($0.50 on Mondays)               |

You've inherited this legacy code from the guy who worked here before you and
have now been tasked with adding support for the following items:

    | Item Name           | Price                                 |
    |---------------------|---------------------------------------|
    | Mahi Fillet         | $7.99                                 |
    | Mac & Cheese        | $1.29 (or 10 for $10.00 on Saturdays) |
    | Super Ripe Avacados | $1.10 or Buy 1 get 2 Free             |

You may change anything about the code you want as long as the exisitng tests
still pass without changes.

To install the dependencies:

    bundle install

To run the tests:

    rake

To Submit Code
--------------

1. Clone the repo
2. Make your changes and check them in locally
3. Create a patchfile using `format-patch`

    `git format-patch origin/master --stdout > submission.patch`

4. Email us the patch file

Please don't fork this repo or submit pull requests ;-)
