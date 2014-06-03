import UIKit

/* Cells in table view can either have a description or an image. Demonstrates
   an algebraic data type. */
enum CellData {
    case DescriptiveCell(title: String, description: String, url: String)
    case ImageCell(title: String, imageName: String, url: String)
    
    /* Computed property that grabs the url associated value out of the
       enum object. */
    var url: String {
        get {
            switch(self) {
                case var .DescriptiveCell(_, _, url):
                    return url
                case var .ImageCell(_, _, url):
                    return url
            }
        }
    }
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView : UITableView
    
    /* Immutable list of the data for our table. */
    let DefaultCells : CellData[] = [
        .DescriptiveCell(title: "Github", description: "Build software better, together", url: "http://github.com/"),
        .ImageCell(title: "Unsplash", imageName: "coffee.png", url: "http://unsplash.com"),
        .DescriptiveCell(title: "Hacker News", description: "A social news website that caters to programmers and entrepreneurs", url:"http://news.ycombinator.com")
    ]
    
    init() {
        /* UIKit will autoload MainViewController.xib as the nib. */
        super.init(nibName: nil, bundle: nil)
    }

    // #pragma mark - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return DefaultCells.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!  {
        let data = DefaultCells[indexPath.row]
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)

        switch(data) {
            case .DescriptiveCell(var title, var description, _):
                cell.textLabel.text = title
                cell.detailTextLabel.text = description
            case .ImageCell(var title, var imageName, _):
                cell.textLabel.text = title
                cell.imageView!.image = UIImage(named: imageName)
        }
        
        return cell
    }
    
    // #pragma mark UITableViewDelegate
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let data = DefaultCells[indexPath.row]
        UIApplication.sharedApplication()!.openURL(NSURL.URLWithString(data.url))
    }
}
