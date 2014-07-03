

import Foundation
import UIKit

extension UIImageView {
    func setWebImage(url:NSString,placeHolder:UIImage?,flag:Int,completeBlock:((imageView:UIImageView)->())?,errorBlock:((imageView:UIImageView)->())?){
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
        dispatch_async(dispatch_get_main_queue()) {
            var URL = NSURL(string: url)
            var path = NSHomeDirectory().stringByAppendingFormat("%@",FILEPATH)
            NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil, error: nil)
            path = NSHomeDirectory().stringByAppendingFormat("%@/%u",FILEPATH,URL.description.hash)
            var data:NSData? = NSData(contentsOfFile:path)
            if data == nil {
                data = NSData(contentsOfURL:URL)
                if data{
                    data!.writeToFile(path,atomically:true)
                }
            }
            if data {
                if completeBlock {
                    completeBlock!(imageView: self)
                }
                if self.tag == flag || flag == 0{
                    self.image = UIImage(data:data)
                }
            }else {
                if errorBlock {
                    errorBlock!(imageView: self)
                }
            }
            ai.stopAnimating()
            ai.removeFromSuperview()
        }
    }
    
    func setWebImage(url:NSString,placeHolder:UIImage?,flag:Int){
        self.setWebImage(url, placeHolder: placeHolder, flag: flag, completeBlock:nil, errorBlock:nil)
    }
    
    func setWebImage(url:NSString){
        self.setWebImage(url, placeHolder: nil, flag: 0)
    }
}