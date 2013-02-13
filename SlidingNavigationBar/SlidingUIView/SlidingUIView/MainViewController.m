//
//  ViewController.m
//  SlidingUIView
//
//  Created by Puru Shukla on 10/02/13.
//  Copyright (c) 2013 YourCompany. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property BOOL secondViewVisible;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.secondViewVisible = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuItemAction:(id)sender {
    [UIView animateWithDuration:.25
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         if(!self.secondViewVisible){
                             CGRect secondaryViewFrame = self.secondaryView.frame;
                             CGRect primaryViewFrame = self.primaryView.frame;
                             
                             //show the table view first
                             self.secondViewVisible = YES;
                             
                             primaryViewFrame.origin.x = secondaryViewFrame.size.width;
                             //change the initial location of the map view
                             [self.primaryView setFrame:primaryViewFrame];
                         }else{
                             CGRect primaryViewFrame = self.primaryView.frame;
                             primaryViewFrame.origin.x = 0.0;
                             [self.primaryView setFrame:primaryViewFrame];
                             
                             self.secondViewVisible = NO;
                         }
                     }
                     completion:^(BOOL finished) {
                     }];
}


#pragma mark - CollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"MyCellID";
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UICollectionViewCell alloc] init];
    }
    
    if(indexPath.row%2 == 0)
        cell.backgroundColor = [UIColor greenColor];
    else
        cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}
@end
