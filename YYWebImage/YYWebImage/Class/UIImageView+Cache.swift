

import Foundation
import UIKit

extension UIImageView{
    class func removeCacheImage(#key:NSString)->Bool{
        var URL = NSURL(string: key)
        var path = NSHomeDirectory().stringByAppendingFormat("%@/%u",FILEPATH, URL.description.hash)
        var manager = NSFileManager.defaultManager()
        var error:NSErrorPointer?
        if manager.fileExistsAtPath(path){
            manager.removeItemAtPath(path, error:error!)
        }
        if error{
            return false
        }
        return true
    }
    
    class func removeAllCacheImages(){
        var manager = NSFileManager.defaultManager()
        var path = NSHomeDirectory().stringByAppendingFormat("%@",FILEPATH)
        if manager.fileExistsAtPath(path){
            manager.removeItemAtPath(path, error:nil)
        }
    }
}