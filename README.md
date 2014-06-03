Simple Swift language example of populating a UITableView with data. Includes an enum type to demonstrate Swift's handling of algebraic data types.

Just a few gotchas I found while hacking on this code:

 - The swift equivalent of `[UITableViewCell class]` is `UITableViewCell.self`;
 - XCode autocomplete for protocol methods breaks when you inherit from `UITableViewDelegate` and `UITableViewDataSource`;
 - GitHub needs to add syntax highlighting for Swift :)
