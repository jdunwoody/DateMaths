#import "DateMathsViewController.h"
#import "OperatorCollection.h"
#import "DigitCollectionDataSource.h"
#import "OperatorCollectionDataSource.h"
#import "ResultsCollectionViewDataSource.h"
#import "Digit.h"
#import "LevelCollectionViewDataSource.h"
#import "LevelCollection.h"
#import "ResultsCollection.h"
#import "LevelItem.h"
#import "Operator.h"
#import "OperatorFactory.h"
#import "DigitFactory.h"
#import "DigitCollection.h"
#import "ResultCollectionViewLayout.h"
#import "SimpleCollectionViewCell.h"
#import "DataItemView.h"
#import "Sounds.h"
#import "UIViewController+jamesGradientBackground.h"
#import "Theme.h"

@interface DateMathsViewController ()

@property (nonatomic, readonly) NSString *formattedDate;

@property (nonatomic, strong) DigitCollectionDataSource *digitCollectionDataSource;
@property (nonatomic, strong) OperatorCollectionDataSource *operatorCollectionDataSource;
@property (nonatomic, strong) ResultsCollectionViewDataSource *resultsCollectionViewDataSource;
@property (nonatomic, strong) LevelCollectionViewDataSource *levelCollectionViewDataSource;

@property (nonatomic, strong) LevelCollection *levelCollection;
@property (nonatomic, strong) UIView *draggingImageView;
@property (nonatomic, strong) ResultCollectionViewLayout *layout;
@property (nonatomic, strong) id<DataItem> selectedDataItem;
@property (nonatomic, strong) Sounds *sounds;
@end

@implementation DateMathsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self dateMaths_gradientBackgroundWhiteToGray];

    UINib *nib = [UINib nibWithNibName:@"SimpleCollectionViewCell" bundle:[NSBundle mainBundle]];

    DigitFactory *digitFactory = [[DigitFactory alloc] initWithDate:[NSDate date]];
    OperatorFactory *operatorFactory = [[OperatorFactory alloc] initWithSymbols:@[@"+", @"-", @"/", @"*", @"(", @")"]];
    self.levelCollection = [[LevelCollection alloc] initWithDigitFactory:digitFactory operatorFactory:operatorFactory];

    //Level
    self.levelCollectionViewDataSource = [[LevelCollectionViewDataSource alloc] initWithCollection:self.levelCollection];
    self.levelCollectionView.dataSource = self.levelCollectionViewDataSource;
    self.levelCollectionView.delegate = self;
    [self.levelCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];

    //Digits
    self.digitCollectionDataSource = [[DigitCollectionDataSource alloc] initWithLevelCollection:self.levelCollection withDelegate:self];
    self.digitCollectionView.dataSource = self.digitCollectionDataSource;
    self.digitCollectionView.delegate = self;
    [self.digitCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];

    //Operators
    self.operatorCollectionDataSource = [[OperatorCollectionDataSource alloc] initWithLevelCollection:self.levelCollection];
    self.operatorCollectionView.dataSource = self.operatorCollectionDataSource;
    self.operatorCollectionView.delegate = self;
    [self.operatorCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];

    //Results
    self.resultsCollectionViewDataSource = [[ResultsCollectionViewDataSource alloc] initWithLevelCollection:self.levelCollection];
    self.resultsCollectionView.dataSource = self.resultsCollectionViewDataSource;
    self.resultsCollectionView.delegate = self;
    [self.resultsCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];

    self.layout = (ResultCollectionViewLayout *)self.resultsCollectionView.collectionViewLayout;
    self.layout.levelCollection = self.levelCollection;

    self.totalLabel.text = [self showValue:@0];
    self.totalLabel.textColor = [Theme colourMain];
    self.sounds = [[Sounds alloc] init];
    [self playBackgroundMusic];

    [self dateMaths_showNavigationController];
    ((UINavigationItem *)self.navigationBar.items[0]).title = @"100pts";
//    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName : [Theme fontWithSize:21]}];

}

- (void)playBackgroundMusic
{
    [self.sounds playBackgroundMusic];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.digitCollectionView) {
        [self clickedDigitCollectionAtIndexPath:indexPath];

    } else if (collectionView == self.operatorCollectionView) {
        [self clickedOperatorCollectionAtIndexPath:indexPath];

    } else if (collectionView == self.resultsCollectionView) {
        [self clickedResultsCollectionAtIndexPath:indexPath];

    } else if (collectionView == self.levelCollectionView) {
        [self clickedLevelCollectionAtIndexpath:indexPath];
    }

    [self updateSum];

    [self.levelCollectionView reloadData];
}

- (void)updateSum
{
    NSNumber *sum = self.levelCollection.current.resultsCollection.sum;
    LevelItem *current = self.levelCollection.current;
    [current updateStarsWithSum:sum witDigitsCollection:self.levelCollection.current.digitCollection];
    self.totalLabel.text = [self showValue:sum];
}

- (void)clickedLevelCollectionAtIndexpath:(NSIndexPath *)indexPath
{
    LevelItem *target = self.levelCollection[(NSUInteger)indexPath.row];
    self.levelCollection.current = target;

    [self.resultsCollectionView reloadData];
    [self.operatorCollectionView reloadData];
    [self.digitCollectionView reloadData];
}

- (void)clickedResultsCollectionAtIndexPath:(NSIndexPath *)indexPath
{
    [self.sounds playSoundEffect];
    id<DataItem> resultItem = self.resultsCollectionViewDataSource[indexPath.row];

    if ([resultItem isKindOfClass:[Digit class]]) {
        Digit *digit = resultItem;
        digit.used = NO;
        [self.digitCollectionView reloadData];
    }

    [self.resultsCollectionViewDataSource removeItem:resultItem];

    [self.resultsCollectionView reloadData];
    if ([resultItem isKindOfClass:Operator.class]) {
        [self.operatorCollectionView reloadData];
    } else {
        [self.digitCollectionView reloadData];
    }
}

- (void)clickedOperatorCollectionAtIndexPath:(NSIndexPath *)indexPath
{
    [self.sounds playSoundEffect];
    Operator *operatorTemplate = self.levelCollection.current.operatorCollection[(NSUInteger)indexPath.row];
    Operator *operator = [[Operator alloc] initWithOperator:operatorTemplate];

    [self.levelCollection.current useOperator:operator];

    [self.resultsCollectionView reloadData];
    [self.operatorCollectionView reloadItemsAtIndexPaths:@[indexPath]];
}

- (void)clickedDigitCollectionAtIndexPath:(NSIndexPath *)indexPath
{
    [self.sounds playSoundEffect];
    Digit *digit = self.levelCollection.current.digitCollection[(NSUInteger)indexPath.row];
    if (digit.used) {
        return;
    }

    [self.levelCollection.current useDigit:digit];

    digit.used = YES;

    [self.resultsCollectionView reloadData];
    [self.digitCollectionView reloadItemsAtIndexPaths:@[indexPath]];
}

- (void)didLayoutCell:(NSIndexPath *)path inCollectionView:(UICollectionView *)view
{
}

- (NSString *)showValue:(NSNumber *)sum
{
    if (!sum) {
        return @"Error";
    }
    return [NSString stringWithFormat:@"= %i", [sum intValue]];
}

- (IBAction)panned:(id)sender
{
    if (self.dragResultsPanGestureRecogniser.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [self.dragResultsPanGestureRecogniser locationInView:self.resultsCollectionView];
        NSIndexPath *indexPathForSelectedItem = [self.resultsCollectionView indexPathForItemAtPoint:location];
        self.selectedDataItem = self.resultsCollectionViewDataSource[indexPathForSelectedItem.row];
        self.selectedDataItem.dragging = YES;
        [self.resultsCollectionView reloadItemsAtIndexPaths:@[indexPathForSelectedItem]];

        DataItemView *dataItemView = [self.layout dataitemViewNearestLocation:location];

        if (!self.draggingImageView) {
            self.draggingImageView = [[UIView alloc] initWithFrame:CGRectMake(dataItemView.rect.origin.x, dataItemView.rect.origin.y, 3, SIMPLE_COLLECTION_VIEW_CELL_HEIGHT)];
            self.draggingImageView.backgroundColor = [UIColor redColor];
            [self.resultsCollectionView addSubview:self.draggingImageView];
        }

        self.draggingImageView.frame = CGRectMake(
            dataItemView.rect.origin.x,
            dataItemView.rect.origin.y,
            self.draggingImageView.frame.size.width,
            self.draggingImageView.frame.size.height);

//        [self.sounds playSoundEffect];

    } else if (self.dragResultsPanGestureRecogniser.state == UIGestureRecognizerStateEnded) {
        [self.draggingImageView removeFromSuperview];
        self.draggingImageView = nil;

        CGPoint location = [self.dragResultsPanGestureRecogniser locationInView:self.resultsCollectionView];
        NSIndexPath *indexPathForTargetDataItem = [self.resultsCollectionView indexPathForItemAtPoint:location];
        id<DataItem> targetDataItem = self.resultsCollectionViewDataSource[indexPathForTargetDataItem.row];

        if (targetDataItem != self.selectedDataItem) {
            [self.levelCollection.current.resultsCollection moveDataItem:self.selectedDataItem toDataItem:targetDataItem];
        }

        self.selectedDataItem.dragging = NO;
        self.selectedDataItem = nil;
        for (id<DataItem> dataItem in self.levelCollection.current.resultsCollection) {
            if (dataItem.dragging) {
                NSAssert(NO, @"Shouldn't get here");
            }
        }
        [self.resultsCollectionView reloadData];
//        [self.sounds playSoundEffect];
        [self updateSum];

    } else if (self.dragResultsPanGestureRecogniser.state == UIGestureRecognizerStateChanged) {
        CGPoint location = [self.dragResultsPanGestureRecogniser locationInView:self.resultsCollectionView];
        DataItemView *dataItemView = [self.layout dataitemViewNearestLocation:location];

        if (!CGPointEqualToPoint(self.draggingImageView.frame.origin, dataItemView.rect.origin)) {
            self.draggingImageView.frame = CGRectMake(
                dataItemView.rect.origin.x,
                dataItemView.rect.origin.y,
                self.draggingImageView.frame.size.width,
                self.draggingImageView.frame.size.height);

            [self.sounds playSoundEffect];
        }

    } else if (self.dragResultsPanGestureRecogniser.state == UIGestureRecognizerStateCancelled) {
        NSAssert(NO, @"Shouldn't get here");

    } else if (self.dragResultsPanGestureRecogniser.state == UIGestureRecognizerStateFailed) {
        NSAssert(NO, @"Shouldn't get here");

    } else {
        NSAssert(NO, @"Shouldn't get here");
    }
}

@end
