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

@interface DateMathsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *digitLabel;
@property (weak, nonatomic) IBOutlet UILabel *formattedDateLabel;

@property (nonatomic, readonly) NSString *formattedDate;

@property (nonatomic, strong) DigitCollectionDataSource *digitCollectionDataSource;
@property (nonatomic, strong) OperatorCollectionDataSource *operatorCollectionDataSource;
@property (nonatomic, strong) ResultsCollectionViewDataSource *resultsCollectionViewDataSource;
@property (nonatomic, strong) LevelCollectionViewDataSource *levelCollectionViewDataSource;

@property (nonatomic, strong) LevelCollection *levelCollection;
@end

@implementation DateMathsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UINib *nib = [UINib nibWithNibName:@"SimpleCollectionViewCell" bundle:[NSBundle mainBundle]];

    DigitFactory *digitFactory = [[DigitFactory alloc] initWithDate:[NSDate date]];
    OperatorFactory *operatorFactory = [[OperatorFactory alloc] initWithSymbols:@[@"+", @"-", @"/", @"*", @"(", @")"]];
    self.levelCollection = [[LevelCollection alloc] initWithDigitsFactory:digitFactory operatorFactory:operatorFactory];

    //Level
    self.levelCollectionViewDataSource = [[LevelCollectionViewDataSource alloc] initWithCollection:self.levelCollection];
    self.levelCollectionView.dataSource = self.levelCollectionViewDataSource;
    self.levelCollectionView.delegate = self;
    [self.levelCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];

    //Digits
    self.digitCollectionDataSource = [[DigitCollectionDataSource alloc] initWithCollection:self.levelCollection withDelegate:self];
    self.digitCollectionView.dataSource = self.digitCollectionDataSource;
    self.digitCollectionView.delegate = self;
    [self.digitCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];

    //Operators
    self.operatorCollectionDataSource = [[OperatorCollectionDataSource alloc] initWithCollection:self.levelCollection];
    self.operatorCollectionView.dataSource = self.operatorCollectionDataSource;
    self.operatorCollectionView.delegate = self;
    [self.operatorCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];

    //Results
    self.resultsCollectionViewDataSource = [[ResultsCollectionViewDataSource alloc] initWithCollection:self.levelCollection];
    self.resultsCollectionView.dataSource = self.resultsCollectionViewDataSource;
    self.resultsCollectionView.delegate = self;
    [self.resultsCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];

    //    ResultCollectionViewLayout *layout = (ResultCollectionViewLayout *)self.resultsCollectionView.collectionViewLayout;
    //    layout.levelCollection = self.levelCollection;

    self.totalLabel.text = [self showValue:nil];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.digitCollectionView) {
        Digit *digit = self.levelCollection.digits[(NSUInteger)indexPath.row];
        if (digit.used) {
            return;
        }

        [self.levelCollection.current useDigit:digit];

        digit.used = YES;

        [self.resultsCollectionView reloadData];
        [self.digitCollectionView reloadItemsAtIndexPaths:@[indexPath]];

    } else if (collectionView == self.operatorCollectionView) {
        Operator *operator= self.levelCollection.operators[(NSUInteger)indexPath.row];

        [self.levelCollection.current useOperator:operator];

        [self.resultsCollectionView reloadData];
        [self.operatorCollectionView reloadItemsAtIndexPaths:@[indexPath]];

    } else if (collectionView == self.resultsCollectionView) {
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

    } else if (collectionView == self.levelCollectionView) {
        LevelItem *target = self.levelCollection[(NSUInteger)indexPath.row];
        self.levelCollection.current = target;

        [self.resultsCollectionView reloadData];
        [self.operatorCollectionView reloadData];
        [self.digitCollectionView reloadData];
    }

    NSNumber *sum = self.levelCollection.results.sum;
    LevelItem *current = self.levelCollection.current;
    [current updateStarsWithSum:sum witDigitsCollection:self.levelCollection.digits];

    [self.levelCollectionView reloadData];

    self.totalLabel.text = [self showValue:sum];
}

- (void)didLayoutCell:(NSIndexPath *)path inCollectionView:(UICollectionView *)view
{
//    self.digitHeightLayoutConstraint.constant = self.digitCollectionView.contentSize.height;
//    self.operatorHeightLayoutConstraint.constant = self.operatorCollectionView.contentSize.height;
}

- (NSString *)showValue:(NSNumber *)sum
{
    if (!sum) {
        return @"Error";
    }
    return [NSString stringWithFormat:@"%i", [sum intValue]];
}

@end
