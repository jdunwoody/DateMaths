#import "DateMathsViewController.h"
#import "DigitCollection.h"
#import "CALayer+NewCategory.h"
#import "OperatorCollection.h"
#import "DigitCollectionDataSource.h"
#import "OperatorCollectionDataSource.h"
#import "ResultsCollectionViewDataSource.h"
#import "Digit.h"

@interface DateMathsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *digitLabel;
@property (weak, nonatomic) IBOutlet UILabel *formattedDateLabel;

@property (nonatomic, readonly) NSString *formattedDate;

@property (nonatomic, strong) DigitCollection *digitCollection;
@property (nonatomic, strong) OperatorCollection *operatorCollection;

@property (nonatomic, strong) DigitCollectionDataSource *digitCollectionDataSource;
@property (nonatomic, strong) OperatorCollectionDataSource *operatorCollectionDataSource;
@property (nonatomic, strong) ResultsCollectionViewDataSource *resultsCollectionViewDataSource;
@end

@implementation DateMathsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UINib *nib = [UINib nibWithNibName:@"SimpleCollectionViewCell" bundle:[NSBundle mainBundle]];

    //Digits
    self.digitCollection = [[DigitCollection alloc] initWithDate:[NSDate date]];
    self.digitCollectionDataSource = [[DigitCollectionDataSource alloc] initWithDigitCollection:self.digitCollection withDelegate:self];
    self.digitCollectionView.dataSource = self.digitCollectionDataSource;
    self.digitCollectionView.delegate = self;
    [self.digitCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];
    [self.digitCollectionView.layer addBlackBorder];

    //Operators
    self.operatorCollection = [[OperatorCollection alloc] init];
    self.operatorCollectionDataSource = [[OperatorCollectionDataSource alloc] initWithOperatorCollection:self.operatorCollection];
    self.operatorCollectionView.dataSource = self.operatorCollectionDataSource;
    self.operatorCollectionView.delegate = self;
    [self.operatorCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];
    [self.operatorCollectionView.layer addBlackBorder];

    //Results
    self.resultsCollectionViewDataSource = [[ResultsCollectionViewDataSource alloc] init];
    self.resultsCollectionView.dataSource = self.resultsCollectionViewDataSource;
    self.resultsCollectionView.delegate = self;
    [self.resultsCollectionView registerNib:nib forCellWithReuseIdentifier:@"simpleCell"];
    [self.resultsCollectionView.layer addBlackBorder];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.digitCollectionView) {
        Digit *digit = self.digitCollection[indexPath.row];
        if (digit.used) {
            return;
        }
        digit.used = YES;
        [self.resultsCollectionViewDataSource addItem:digit];
        [self.resultsCollectionView reloadData];
        [self.digitCollectionView reloadItemsAtIndexPaths:@[indexPath]];

    } else if (collectionView == self.operatorCollectionView) {
        [self.resultsCollectionViewDataSource addItem:self.operatorCollection[indexPath.row]];
        [self.resultsCollectionView reloadData];
        [self.operatorCollectionView reloadItemsAtIndexPaths:@[indexPath]];

    } else if (collectionView == self.resultsCollectionView) {

    }
}

- (void)didLayoutCell:(NSIndexPath *)path inCollectionView:(UICollectionView *)view
{
    self.digitHeightLayoutConstraint.constant = self.digitCollectionView.contentSize.height;
    self.operatorHeightLayoutConstraint.constant = self.operatorCollectionView.contentSize.height;
}

@end
