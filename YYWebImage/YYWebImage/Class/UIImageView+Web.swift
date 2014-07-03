

import Foundation
import UIKit

extension UIImageView {
    func setWebImage(url:NSString,placeHolder:UIImage?,flag:Int){
        self.userInteractionEnabled = false
        self.layer.removeAllAnimations()
        if placeHolder {
            self.image = placeHolder
        }
        var ai = UIActivityIndicatorView(activityIndicatorStyle:UIActivityIndicatorViewStyle.Gray)
        ai.tag = 20000
        self.addSubview(ai)
        ai.center = self.center
        ai.startAnimating()
        var aUrl = NSURL(string: url)
        dispatch_async(dispatch_get_main_queue()) {
            var path = NSHomeDirectory().stringByAppendingFormat("/Library/Caches/%u", aUrl.description.hash)
            var data:NSData? = NSData(contentsOfFile:path)
            if data == nil {
                data = NSData(contentsOfURL:aUrl)
                data!.writeToFile(path,atomically:true)
            }
            if self.tag == flag || flag == 0{
                self.image = UIImage(data:data)
            }
            ai.stopAnimating()
            ai.removeFromSuperview()
        }
    }
    
    func setWebImage(url:NSString){
        self.setWebImage(url, placeHolder: nil, flag: 0)
    }
}