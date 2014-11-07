// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDNote.h instead.

@import CoreData;

extern const struct CDNoteAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *text;
} CDNoteAttributes;

@interface CDNoteID : NSManagedObjectID {}
@end

@interface _CDNote : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CDNoteID* objectID;

@property (nonatomic, strong) NSString* id;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@end

@interface _CDNote (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveId;
- (void)setPrimitiveId:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

@end
