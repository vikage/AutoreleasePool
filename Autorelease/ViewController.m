//
//  ViewController.m
//  Autorelease
//
//  Created by Thanh Vu on 6/26/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self runWithAutorelease];
}

-(void) run {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"largeFile" withExtension:@"jpg"];
    
    for (int i = 0 ; i < 100000; i++) {
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        NSLog(@"image size %f %f", image.size.width, image.size.height);
    }
}

-(void) runWithAutorelease {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"largeFile" withExtension:@"jpg"];
    
    for (int i = 0 ; i < 100000; i++) {
        @autoreleasepool {
            NSData *data = [[NSData alloc] initWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            
            NSLog(@"image size %f %f", image.size.width, image.size.height);
        }
    }
}


@end
