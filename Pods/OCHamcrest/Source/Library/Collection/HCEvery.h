//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>


@interface HCEvery : HCDiagnosingMatcher

@property (readonly, nonatomic, strong) id <HCMatcher> matcher;

- (instancetype)initWithMatcher:(id <HCMatcher>)matcher;

@end


FOUNDATION_EXPORT id HC_everyItem(id itemMatcher);

/**
 everyItem(itemMatcher) -
 Matches if every element of a levelCollection satisfies the given matcher.

 @param itemMatcher  The matcher to apply to every item provided by the examined levelCollection.

 This matcher iterates the evaluated levelCollection, confirming that each element satisfies the given
 matcher.

 Example:

 @par
 @ref everyItem(startsWith(@"Jo"))

 will match a levelCollection [@"Jon", @"John", @"Johann"].

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_everyItem instead.)

 @ingroup collection_matchers
 */
#ifdef HC_SHORTHAND
    #define everyItem HC_everyItem
#endif
