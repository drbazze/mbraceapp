// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDNote.m instead.

#import "_CDNote.h"

const struct CDNoteAttributes CDNoteAttributes = {
	.id = @"id",
	.text = @"text",
};

@implementation CDNoteID
@end

@implementation _CDNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDNote" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDNote";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDNote" inManagedObjectContext:moc_];
}

- (CDNoteID*)objectID {
	return (CDNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic id;

@dynamic text;

@end

