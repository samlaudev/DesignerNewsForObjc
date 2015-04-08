//
//  ArrayDataSource.h
//

#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);
typedef NSString* (^TableViewCellConfigureCellIdentifier)(NSIndexPath* indexPath);
typedef NSInteger(^TableViewArrayCountBlock)(NSArray *array);

@interface ArrayDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray*)anItems
        cellIdentifier:(NSString*)aCellIdentifier
    configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath*)indexPath;

@property (nonatomic, strong, readonly) NSArray* items;

@end
