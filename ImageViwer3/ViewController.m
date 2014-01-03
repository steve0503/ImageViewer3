//
//  ViewController.m
//  ImageViwer3
//
//  Created by 이 해용 on 2014. 1. 2..
//  Copyright (c) 2014년 iamdreamer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSUInteger imageIndex;

}

@property (weak, nonatomic) IBOutlet UIButton *prevButton;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UIImageView *picViewer;



@end

@implementation ViewController

- (IBAction)prevButton:(id)sender {
    
    if (imageIndex  > 1) {
        
        self.nextButton.Enabled = YES;
        
        imageIndex--;
        
        [self refreshImage];
    }
    else
    {
        self.prevButton.Enabled = NO;
    }
    
}


- (IBAction)nextButton:(id)sender {
    
   
    
    if (imageIndex < 5) {
        
        
        self.prevButton.Enabled = YES;
        
        imageIndex++;
    
        [self refreshImage];
    }
    else
    {
        self.nextButton.Enabled = NO;
    }
}

-(void)refreshImage
{
    NSString *picName = [NSString stringWithFormat:@"iu%d", (int)imageIndex];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:picName ofType:@"jpg"];
    
    UIImage *currentImage = [UIImage imageWithContentsOfFile:imagePath];
    
    self.picViewer.image = currentImage;

}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    imageIndex = 1;

    // Hiding Status Bar
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [self prefersStatusBarHidden];
        
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }


    [self refreshImage];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
