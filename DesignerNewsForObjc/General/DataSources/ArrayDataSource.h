//
//  ArrayDataSource.h
//

#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface ArrayDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray*)anItems
        cellIdentifier:(NSString*)aCellIdentifier
    configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;
- (id)itemAtIndexPath:(NSIndexPath*)indexPath;

@property (nonatomic, strong, readonly) NSArray* items;

@end
