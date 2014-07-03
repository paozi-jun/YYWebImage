

import UIKit

class MainViewController: UIViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var url = "http://www.nanningjie.com/uploads/allimg/140528/16051M160-0.jpg"
        UIImageView.removeAllCacheImages()
        
        var imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(imageView)
        imageView.setWebImage(url, placeHolder: nil, flag: 0, completeBlock:{(imageView: UIImageView) -> () in
            println("完成")
            }, errorBlock: {(imageView: UIImageView) -> () in
                println("失败了")
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
