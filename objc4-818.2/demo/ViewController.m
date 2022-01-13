//
//  ViewController.m
//  demo
//
//  Created by wy on 31/12/2021.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    Person *person = [[Person alloc] init];
//    __weak typeof(person) weakPerson = person;
//    objc_setAssociatedObject(person, "name", @"wy", OBJC_ASSOCIATION_COPY_NONATOMIC);
//
//    [person xxx];
    
    NSLog(@"main");
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 15 * NSEC_PER_SEC), DISPATCH_TIME_FOREVER, 1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"dispatch_source_set_event_handler");
        dispatch_source_cancel(timer);
    });
    dispatch_source_set_cancel_handler(timer, ^{
        NSLog(@"dispatch_source_set_cancel_handler");
    });
    dispatch_resume(timer);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}


@end
