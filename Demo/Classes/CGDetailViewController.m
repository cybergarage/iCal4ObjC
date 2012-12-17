//
//  CGDetailViewController.m
//  iCalToDo
//
//  Created by Satoshi Konno on 11/05/16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CGDetailViewController.h"

enum {
CGICALTODO_DETAILVIEWCONTROLLER_SECTION_SUMMARY = 0,
CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO,
CGICALTODO_DETAILVIEWCONTROLLER_SECTION_NOTES,
CGICALTODO_DETAILVIEWCONTROLLER_SECTION_COUNT,
};

enum {
CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO_CREATED = 0,
CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO_MODIFIED,
CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO_COMPLETED,
CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO_COUNT,
};

#define CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_FONTSIZE              16.0
#define CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_WIDTH                 280.0
#define CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_HEIGHT                30.0
#define CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_XOFFSET               10.0
#define CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_YOFFSET(tableView)    ((tableView.rowHeight - CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_HEIGHT + 6.0) / 2.0)

#define CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_NOTESECTION_SCALE 3.0

@interface CGDetailViewController()
- (UITextField *)createTextFieldWithRect:(CGRect)frame;
- (UITextView *)createTextViewWithRect:(CGRect)frame;
@end

@implementation CGDetailViewController

@synthesize todo;
@synthesize delegate;
@synthesize summaryField;
@synthesize descField;
@synthesize modalMode;

- (id)initWithTodo:(CGICalendarComponent *)aTodo {
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		[self setTodo:aTodo];
		[self setModalMode:NO];
		/* Summary Field */
		[self setSummaryField:[self createTextFieldWithRect:CGRectMake(CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_XOFFSET,
																	   CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_YOFFSET(self.tableView),
																	   CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_WIDTH,
																	   CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_HEIGHT)]];
		[[self summaryField] setText:[aTodo summary]];
		/* Description Field */
		[self setDescField:[self createTextViewWithRect:CGRectMake(CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_XOFFSET,
																	   CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_YOFFSET(self.tableView),
																	   CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_WIDTH,
																	   [[self tableView] rowHeight] * CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_NOTESECTION_SCALE - (CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_YOFFSET(self.tableView) * 2))]];
		[[self descField] setText:[aTodo notes]];
	}
	return self;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];

	[self setTitle:[todo summary]];
	[[self navigationController] setToolbarHidden:NO];
	if ([self isModalMode]) {
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doDone)];
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(doCancel)];
	} else {
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doDone)];
		 [self setToolbarItems:[NSArray arrayWithObjects:
		 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(doCancel)],         nil] animated:NO];
	}
}

- (void)viewDidUnload {
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return CGICALTODO_DETAILVIEWCONTROLLER_SECTION_COUNT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_SUMMARY:
			return  1;
		case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO:
			return  CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO_COUNT;
		case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_NOTES:
			return  1;
	}
	return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	switch (section) {
		case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_SUMMARY:
			return  @"";
		case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO:
			return  @"";
	 case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_NOTES:
		return  @"Notes";
	}
	return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	CGFloat rowHeight = [tableView rowHeight];
	switch ([indexPath section]) {
		case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_NOTES:
			rowHeight *= CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_NOTESECTION_SCALE;
			break;
	}
	return rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
	}
	// Configure the cell...
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	NSString *titleString = @"";
	NSString *detailTitleString = @"";
	switch ([indexPath section]) {
		case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_SUMMARY:
			[cell.contentView addSubview:[self summaryField]];
			break;
		case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO:
			switch ([indexPath row]) {
				case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO_CREATED:
					titleString = @"Created";
					detailTitleString = [[todo created] descriptionISO8601];
					break;
				case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO_MODIFIED:
					titleString = @"Modified";
					detailTitleString = [[todo lastModified] descriptionISO8601];
					break;
				case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_INFO_COMPLETED:
					titleString = @"Completed";
					detailTitleString = [[todo completed] descriptionISO8601];
					break;
				default:
					break;
			}
		case CGICALTODO_DETAILVIEWCONTROLLER_SECTION_NOTES:
			[cell.contentView addSubview:[self descField]];
			break;
	}
	[[cell textLabel] setText:titleString];
	[[cell detailTextLabel] setText:detailTitleString];
	return cell;
}

#pragma mark - Button Actions

- (void)doDone {
	[[self todo] incrementSequenceNumber];
	[[self todo] setSummary:[summaryField text]];
	[[self todo] setNotes:[descField text]];
	[[self todo] setLastModified:[NSDate date]];

	if ([self delegate]) {
		[[self delegate] icalTodoDetailViewController:self didFinished:[self todo]];
	}
	if ([self isModalMode]) {
		[self dismissViewControllerAnimated:YES completion:nil];
	} else {
		[[self navigationController] popViewControllerAnimated:YES];
	}
}

- (void)doCancel {
	if ([self delegate]) {
		[[self delegate] icalTodoDetailViewController:self didCanceled:[self todo]];
	}
	if ([self isModalMode]) {
		[self dismissViewControllerAnimated:YES completion:nil];
	} else {
		[[self navigationController] popViewControllerAnimated:YES];
	}
}

#pragma mark - TextField

- (UITextField *)createTextFieldWithRect:(CGRect)frame {
	UITextField *textField = [[UITextField alloc] initWithFrame:frame];
	textField.borderStyle = UITextBorderStyleNone;
	textField.textColor = [UIColor blackColor];
	textField.font = [UIFont systemFontOfSize:CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_FONTSIZE];
	textField.backgroundColor = [UIColor whiteColor];
	textField.autocorrectionType = UITextAutocorrectionTypeNo;
	textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	textField.keyboardType = UIKeyboardTypeDefault;
	textField.returnKeyType = UIReturnKeyDefault;
	textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	textField.clearButtonMode = UITextFieldViewModeWhileEditing;
	textField.delegate = self;
	return textField;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
	[textField resignFirstResponder];
	return YES;
}

- (UITextView *)createTextViewWithRect:(CGRect)frame {
	UITextView *textView = [[UITextView alloc] initWithFrame:frame];
	textView.textColor = [UIColor blackColor];
	textView.font = [UIFont systemFontOfSize:CGICALTODO_DETAILVIEWCONTROLLER_TEXTFIELD_FONTSIZE];
	textView.backgroundColor = [UIColor whiteColor];
	textView.autocorrectionType = UITextAutocorrectionTypeNo;
	textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
	textView.keyboardType = UIReturnKeyDone;
	textView.returnKeyType = UIReturnKeyDefault;
	textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
	textView.delegate = self;
	return textView;
}

/*
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if ([text isEqualToString:@"\n"]) {
		[textView resignFirstResponder];
		[[self tableView] reloadData];
		return NO;
	}
	return YES;
}
 */

@end
