//
//  ViewController.m
//  SlidingUIView
//
//  Created by Puru Shukla on 10/02/13.
//  Copyright (c) 2013 YourCompany. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property BOOL tableViewVisible;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableViewVisible = NO;
    
    //create the navigation left bar button item for the menu bar
    UIBarButtonItem* leftMenuButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(menuButtonAction:)];
    self.navigationItem.leftBarButtonItem = leftMenuButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)menuButtonAction:(id)sender{
    [UIView animateWithDuration:.25
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         if(!self.tableViewVisible){
                             CGRect tableFrame = self.tableView.frame;
                             CGRect mapViewFrame = self.mkMapView.frame;
                             
                             //show the table view first
                             self.tableViewVisible = YES;
                             
                             //change the initial location of the map view
                             mapViewFrame.origin.x = tableFrame.size.width;
                             [self.mkMapView setFrame:mapViewFrame];
                         }else{
                             CGRect mapViewFrame = self.mkMapView.frame;
                             mapViewFrame.origin.x = 0.0;
                             [self.mkMapView setFrame:mapViewFrame];
                             
                             self.tableViewVisible = NO;
                         }
                     }
                     completion:^(BOOL finished) {
                     }];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    return 5;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"This is the  slide IN/OUT table view.";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellid = @"cellid";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Item%d", indexPath.row];
    return cell;
}

@end
