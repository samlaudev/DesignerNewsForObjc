//
//  ArrayDataSourceSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ArrayDataSource.h"

SPEC_BEGIN(ArrayDataSourceSpec)

describe(@"ArrayDataSource", ^{
    // Initialize
    __block ArrayDataSource *dataSource = nil;
    __block UITableView *mockTableView = nil;
    
    beforeEach(^{
        TableViewCellConfigureBlock configureBlock = ^(UITableViewCell *a, id b) {
        };
        dataSource = [[ArrayDataSource alloc] initWithItems:@[@"a", @"b"] cellIdentifier:@"Cell" configureCellBlock:configureBlock];
        mockTableView = [UITableView mock];
    });
    
    afterEach(^{
        dataSource = nil;
    });
    
    context(@"when table view get number of cell", ^{
        it(@"should return 2", ^{
            NSInteger count = [dataSource tableView:mockTableView numberOfRowsInSection:0];
            [[theValue(count) should] equal:theValue(2)];
        });
    });
    
    context(@"when table view get cell", ^{
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        it(@"should return dummy cell", ^{
            [[mockTableView should] receive:@selector(dequeueReusableCellWithIdentifier:forIndexPath:) andReturn:cell withArguments:@"Cell", indexPath];
            UITableViewCell *result = [dataSource tableView:mockTableView cellForRowAtIndexPath:indexPath];
            
            [[result should] equal:cell];
        });
    });
});

SPEC_END
