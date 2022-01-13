//
//  main.m
//  demo
//
//  Created by wy on 31/12/2021.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    
    /**
     struct __AtAutoreleasePool {
       __AtAutoreleasePool() {atautoreleasepoolobj = objc_autoreleasePoolPush();}
       ~__AtAutoreleasePool() {objc_autoreleasePoolPop(atautoreleasepoolobj);}
       void * atautoreleasepoolobj;///自动释放池表
     };
     
      @autoreleasepool {
        __AtAutoreleasePool __autoreleasepool;
        appDelegateClassName = NSStringFromClass(((Class (*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("AppDelegate"), sel_registerName("class")));
     }
     
     */
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
