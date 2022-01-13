//
//  Person.m
//  demo
//
//  Created by wy on 31/12/2021.
//

#import "Person.h"
#import "Student.h"
#import <objc/runtime.h>
@implementation Person


void otherxxx(id self, SEL _cmd) {
    NSLog(@"%s",__func__);
}

///动态方法解析 添加一个新的方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(xxx)) {
        
        ///如果动态添加了方法 会重新进入消息发送流程objc_msgSend
//        class_addMethod(self, sel, (IMP)otherxxx, "v16@0:8");
        
        ///(返回YES or NO对结果没有影响, 只要动态添加了方法就会调用)
        return NO;
    }
    return [super resolveInstanceMethod:sel];
}

///消息转发流程
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if (aSelector == @selector(xxx)) {
        //转发给其他对象 返回空会调用消息, 如果返回nil 则会调用methodSignatureForSelector方法
        return [Student new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(xxx)) {
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    //将方法给其他对象调用 处理
    [anInvocation invokeWithTarget:[[Student alloc] init]];
}

@end
