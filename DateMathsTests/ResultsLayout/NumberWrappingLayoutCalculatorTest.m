#import <Specta/Specta.h>
#import "ResultCollectionViewLayout.h"
#import "LevelItem.h"
#import "Digit.h"
#import <Expecta/Expecta.h>
#import "NumberWrappingLayoutCalculator.h"
#import "Operator.h"

SpecBegin(NumberWrappingLayoutCalculator)

    describe(@"NumberWrappingLayoutCalculator", ^{
        describe(@"calculate", ^{

            describe(@"Single Row", ^{

                it(@"should layout on one row", ^{
                    Digit *digit1 = [[Digit alloc] initWithDigit:1.0];
                    Digit *digit2 = [[Digit alloc] initWithDigit:2.0];

                    NSArray *items = @[
                        digit1,
                        digit2,
                    ];

                    CGSize size = CGSizeMake(100.0, 100.0);

                    NSDictionary *calculated = [NumberWrappingLayoutCalculator calculateLayoutSizesForDataItems:items inSize:size ofSize:CGSizeMake(50.0, 50.0)];

                    expect(calculated.count).to.equal(2);
                    expect(((NSValue *)calculated[digit1]).CGRectValue).to.equal(CGRectMake(0, 0, 50, 50));
                    expect(((NSValue *)calculated[digit2]).CGRectValue).to.equal(CGRectMake(50.0, 0.0, 50.0, 50.0));
                });

            });

            describe(@"Multiple Row", ^{

                it(@"should split digits and operators", ^{
                    Digit *digit1 = [[Digit alloc] initWithDigit:1.0];
                    Operator *anOperator = [[Operator alloc] initWithSymbol:@"+"];

                    Digit *digit2 = [[Digit alloc] initWithDigit:2.0];
                    NSArray *items = @[
                        digit1,
                        anOperator,
                        digit2,
                    ];

                    CGSize size = CGSizeMake(100.0, 100.0);

                    NSDictionary *calculated = [NumberWrappingLayoutCalculator calculateLayoutSizesForDataItems:items inSize:size ofSize:CGSizeMake(50.0, 50.0)];

                    expect(calculated.count).to.equal(3);
                    expect(((NSValue *)calculated[digit1]).CGRectValue).to.equal(CGRectMake(0, 0, 50, 50));
                    expect(((NSValue *)calculated[anOperator]).CGRectValue).to.equal(CGRectMake(50.0, 0.0, 50.0, 50.0));
                    expect(((NSValue *)calculated[digit2]).CGRectValue).to.equal(CGRectMake(0.0, 50.0, 50.0, 50.0));
                });

                it(@"should not split digits, wrapping them to the next line", ^{
                    Digit *digit1 = [[Digit alloc] initWithDigit:1.0];
                    Operator *anOperator = [[Operator alloc] initWithSymbol:@"+"];
                    Digit *digit2 = [[Digit alloc] initWithDigit:2.0];
                    Digit *digit3 = [[Digit alloc] initWithDigit:3.0];
                    NSArray *items = @[
                        digit1,
                        anOperator,
                        digit2,
                        digit3,
                    ];

                    CGSize size = CGSizeMake(150.0, 100.0);

                    NSDictionary *calculated = [NumberWrappingLayoutCalculator calculateLayoutSizesForDataItems:items inSize:size ofSize:CGSizeMake(50.0, 50.0)];

                    expect(calculated.count).to.equal(4);
                    expect(((NSValue *)calculated[digit1]).CGRectValue).to.equal(CGRectMake(0, 0, 50, 50));
                    expect(((NSValue *)calculated[anOperator]).CGRectValue).to.equal(CGRectMake(50.0, 0.0, 50.0, 50.0));
                    expect(((NSValue *)calculated[digit2]).CGRectValue).to.equal(CGRectMake(0.0, 50.0, 50.0, 50.0));
                    expect(((NSValue *)calculated[digit3]).CGRectValue).to.equal(CGRectMake(50.0, 50.0, 50.0, 50.0));
                });

            });
        });
    });

SpecEnd;
