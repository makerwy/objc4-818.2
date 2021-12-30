//
//  main.m
//  learn
//
//  Created by wy on 28/12/2021.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject
{
    @public
    int _age;
}

- (void)eat;

@end

@implementation Person

- (void)eat {
    
}

@end

@interface Student : Person
{
    @public
    int _no;
}
- (void)learn;

@end

@implementation Student
- (void)learn {
    
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *stu = [[NSObject alloc] init];
        NSLog(@"main");
    }
    return 0;
}
