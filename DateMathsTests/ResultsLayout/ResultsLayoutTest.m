#import <Specta/Specta.h>
#import "ResultCollectionViewLayout.h"
#import "LevelCollection.h"
#import "LevelItem.h"
#import "DigitCollection.h"
#import "Digit.h"
#import <Expecta/Expecta.h>
#import "OperatorCollection.h"
#import "DigitFactory.h"
#import "OperatorFactory.h"

SpecBegin(ResultCollectionViewLayout)

    describe(@"ResultCollectionViewLayout", ^{
        describe(@"prepareLayout", ^{

            describe(@"Single Row", ^{

                it(@"should layout on one row", ^{
                    ResultCollectionViewLayout *layout = [[ResultCollectionViewLayout alloc] init];
                    DigitFactory *digitFactory = [[DigitFactory alloc] initWithDate:[NSDate date]];
                    OperatorFactory *operatorFactory = [[OperatorFactory alloc] initWithSymbols:@[@"+"]];

                    LevelCollection *levelCollection = [[LevelCollection alloc] initWithDigitsFactory:digitFactory operatorFactory:operatorFactory];

                    [levelCollection.current useDigit:(id<DataItem>)levelCollection.current.digitCollection[0]];
                    [levelCollection.current useDigit:(id<DataItem>)levelCollection.current.digitCollection[1]];
                    [levelCollection.current useDigit:(id<DataItem>)levelCollection.current.operatorCollection[0]];
                    [levelCollection.current useDigit:(id<DataItem>)levelCollection.current.digitCollection[2]];
                    [levelCollection.current useDigit:(id<DataItem>)levelCollection.current.digitCollection[3]];
                    [levelCollection.current useDigit:(id<DataItem>)levelCollection.current.digitCollection[4]];
                    [levelCollection.current useDigit:(id<DataItem>)levelCollection.current.digitCollection[5]];

                    layout.levelCollection = levelCollection;

                    [layout prepareLayout];

                    expect(layout.calculatedLayout).notTo.beNil;
                    expect(layout.calculatedLayout.count).to.equal(1);
                    expect(layout.calculatedLayout[0]).to.equal(CGRectMake(0, 0, 20, 20));
                });

            });
        });
    });

SpecEnd;
