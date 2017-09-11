//
//  DetailVC.m
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 07/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

#import "DetailVC.h"
#import "SwiftAssignment-Swift.h"

@interface DetailVC () <UITableViewDelegate, UITableViewDataSource>
{
    MovieObject * movieBO;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tblViewConstraint;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSynopsis;
@property (weak, nonatomic) IBOutlet UILabel *lblBody;
@property (weak, nonatomic) IBOutlet UITableView *tblCast;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma Mark - Helper Methods
-(void) populateUI {
    movieBO = (MovieObject *)self.movieObject;
    [self.tblCast reloadData];
    self.tblViewConstraint.constant = self.tblCast.contentSize.height;
    self.tblCast.scrollEnabled = false;
    self.lblTitle.text = movieBO.headline;
    self.lblBody.text = movieBO.body;
    self.lblSynopsis.text = movieBO.synopsis;
    [self loadImage];
}
    
-(void) loadImage {
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = true;
    self.imageView.image = [UIImage imageNamed:@"placeholder.png"];
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:movieBO.keyArtImages[0].url]];
        if ( data == nil )
        return;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageView.image = [UIImage imageWithData: data];
        });
        
    });

}

#pragma Mark- UITableView Delegate / UITableView DataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return movieBO.casts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier  = @"Cast Identifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    CastObject * castObject = [movieBO.casts objectAtIndex:indexPath.row];
    cell.textLabel.text = castObject.name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


@end
