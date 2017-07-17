//
//  XCache.swift
//  缓存
//
//  Created by idea_liujl on 17/7/17.
//  Copyright © 2017年 idea_liujl. All rights reserved.
//

import UIKit

class XCache: NSObject {
    
    
    /**
    *  读取缓存大小
    */
    
    static func returnCacheSize() ->String{
        return String(format: "%.2f",XCache.forderSizeAtPath(NSHomeDirectory()))
//        return String(XCache.forderSizeAtPath(NSHomeDirectory()))
    }
    /**
    *  计算单个文件的大小 单位MB
    －parameter path： 文件路径
    
    －returns：返回文件的大小
    */
    
    static func returnFileSize(path :String) ->Double{
        let manage = NSFileManager.defaultManager()
        var fileSize:Double = 0
        do{
            fileSize = try manage.attributesOfItemAtPath(path)["NSFileSize"] as! Double
        }catch{
            
        }
        
        return fileSize/1024/1024
    }
    
    /**
    遍历所有子目录，并计算文件的大小
    
    - parameter folderPath: 目录路径
    
    - returns: 返回文件的大小
    */
    
    static func forderSizeAtPath(folderPath:String) ->Double{
        
        let manage = NSFileManager .defaultManager()
        if !manage.fileExistsAtPath(folderPath){
            return 0
        }
        let childFilePath = manage.subpathsAtPath(folderPath)
        var fileSize:Double = 0
        for path in childFilePath!{
            let fileAbsoluePath = folderPath + "/"+path
            fileSize += XCache.returnFileSize(fileAbsoluePath)
        }
        return fileSize
    }
    /**
    清除缓存
    */
    static func cleanCache(competion:() ->Void){
//        存缓存的目录👇
        XCache.deleteFolder(NSHomeDirectory()+"/")
        
        competion()
    }
    
    /**
    删除单个文件
    
    - parameter path: 文件路径
    */
    
    static func deleteFile(path:String){
       let manage = NSFileManager .defaultManager()
        do{
            try manage.removeItemAtPath(path)
        }catch{
            
        }
        
    }
    /**
    删除文件夹下的所有文件
    
    - parameter path: 文件夹路径
    */
    static func deleteFolder(folderPath:String){
        
        
        
        let manage = NSFileManager .defaultManager()
        if !manage.fileExistsAtPath(folderPath){
        }
        let childFilePath = manage.subpathsAtPath(folderPath)
        for path in childFilePath!{
            let fileAbsoluePath = folderPath + "/"+path
            XCache.deleteFile(fileAbsoluePath)
        }

        
    }

}
