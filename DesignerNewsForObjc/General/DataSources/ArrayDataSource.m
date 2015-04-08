//
//  ArrayDataSource.h
//

#import "ArrayDataSource.h"
#import <ReactiveCocoa.h>
#import "StoryClient.h"
#import "Story.h"

@interface ArrayDataSource ()

@property (nonatomic, strong) NSArray* items;
@property (nonatomic, copy) NSString* cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) TableViewCellConfigureCellIdentifier configureCellIdentifierBlock;

@end

@implementation ArrayDataSource

- (id)init
{
    return nil;
}

- (id)initWithItems:(NSArray*)anItems
        cellIdentifier:(NSString*)aCellIdentifier
    configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    return [self initWithItems:anItems cellIdentifier:aCellIdentifier configureCellBlock:aConfigureCellBlock configureCellIdentifierBlock:nil];
}

- (id)initWithItems:(NSArray*)anItems
                  cellIdentifier:(NSString*)aCellIdentifier
              configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
    configureCellIdentifierBlock:(TableViewCellConfigureCellIdentifier)aConfigureCellIdentifierBlock
{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.configureCellIdentifierBlock = [aConfigureCellIdentifierBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath*)indexPath
{
    return self.items[(NSUInteger)indexPath.row];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    self.cellIdentifier = self.configureCellIdentifierBlock != nil ? self.configureCellIdentifierBlock(indexPath) : self.cellIdentifier;
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

@end
