#import <UIKit/UIKit.h>
#import "FacilitiesLocationData.h"

@class HighlightTableViewCell;
@class MITLoadingActivityView;

@interface FacilitiesLocationDataViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate,UISearchBarDelegate> {
    UITableView *_tableView;
    MITLoadingActivityView *_loadingView;
    
    FacilitiesLocationData *_locationData;
    NSArray *_cachedData;
    NSArray *_filteredData;
    NSPredicate *_filterPredicate;
    NSString *_searchString;
}

@property (nonatomic,retain) UITableView* tableView;
@property (nonatomic,retain) MITLoadingActivityView* loadingView;
@property (retain) FacilitiesLocationData* locationData;
@property (nonatomic,retain) NSPredicate* filterPredicate;

@property (nonatomic,retain) NSArray* cachedData;
@property (nonatomic,retain) NSArray* filteredData;
@property (nonatomic,retain) NSString* searchString;

- (NSArray*)dataForMainTableView;
- (NSArray*)resultsForSearchString:(NSString*)searchText;

- (void)configureMainTableCell:(UITableViewCell*)cell forIndexPath:(NSIndexPath*)indexPath;
- (void)configureSearchCell:(HighlightTableViewCell*)cell forIndexPath:(NSIndexPath*)indexPath;
@end