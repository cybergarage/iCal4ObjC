//
//  CGICalTodoViewController.m
//  iCalToDo
//
//  Created by Satoshi Konno on 5/14/11.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "CGICalTodoViewController.h"
#import "CGICalTodoDetailViewController.h"
#import "CGICalTodoViewCheckButton.h"

#define CG_ICALTODOVIRECONTROLLER_CELL_CHECKBUTTON_TAG  1

@interface CGICalTodoViewController()
@property(retain) NSString *calendarPath;
@property(retain) CGICalendar *calendar;
@property(retain) NSMutableArray *todos;
@property(retain) UIImage *chkBaseImage;
@property(retain) UIImage *chkNoneImage;
@property(retain) UIImage *chkDoneImage;
- (CGICalendarObject *)firstCalendarObject;
- (void)reloadTodoComponents;
- (BOOL)saveCalendar;
- (void)setCheckButtonHidden:(BOOL)flag indexPath:(NSIndexPath *)indexPath;
@end

@implementation CGICalTodoViewController

@synthesize calendar;
@synthesize calendarPath;
@synthesize todos;
@synthesize chkBaseImage;
@synthesize chkNoneImage;
@synthesize chkDoneImage;

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
    }
    return self;
}

- (id)initWithPath:(NSString *)path
{
    self = [self init];
    if (self) {
        [self setPath:path];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - iCalendar methods

- (void)setPath:(NSString *)path
{
    [self setCalendarPath:path];
    [self setCalendar:[[CGICalendar alloc] init]];
    [[self calendar] parseWithPath:path error:nil];
}

- (CGICalendarObject *)firstCalendarObject
{
    if ([[[self calendar] objects] count] <= 0)
        [[self calendar] addObject:[CGICalendarObject object]];
   return [[self calendar] objectAtIndex:0];
}

- (BOOL)saveCalendar
{
    return [[self calendar] writeToFile:[self calendarPath]];
}

- (void)reloadTodoComponents
{
    CGICalendarObject *icalObj = [self firstCalendarObject];
    [self setTodos:[NSMutableArray arrayWithArray:[icalObj todos]]];
}

- (void)setCheckButtonHidden:(BOOL)hidden indexPath:(NSIndexPath *)indexPath 
{
    UITableViewCell *cell = [[self tableView] cellForRowAtIndexPath:indexPath];
    CGICalTodoViewCheckButton *checkButton = (CGICalTodoViewCheckButton *)[cell viewWithTag:CG_ICALTODOVIRECONTROLLER_CELL_CHECKBUTTON_TAG];
    [checkButton setHidden:hidden];
    [[cell imageView] setImage:(hidden ? nil : [self chkBaseImage])];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setTitle:CG_ICALTODOVIRECONTROLLER_TITLE];
    
    [self setChkNoneImage:[UIImage imageNamed:CG_ICALTODOVIRECONTROLLER_IMAGE_CHECKED_NONE]];
    [self setChkDoneImage:[UIImage imageNamed:CG_ICALTODOVIRECONTROLLER_IMAGE_CHECKED_DONE]];
    
   // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [[self navigationController] setToolbarHidden:NO];
    [self setToolbarItems:[NSArray arrayWithObjects:
                           [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(doRefresh)] autorelease], 
                           [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease], 
                           [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(doAdd)] autorelease], 
                           nil] animated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [self reloadTodoComponents];
    
    return [[self todos] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
     
    CGICalendarComponent *todoComp = [[self todos] objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[todoComp summary]];
    [[cell detailTextLabel] setText:[[todoComp created] descriptionISO8601]];
    
    [[cell imageView] setImage:[self chkBaseImage]];
    [[cell imageView] setImage:[todoComp hasPropertyForName:CG_ICALENDAR_PROERTY_COMPLETED] ? [self chkDoneImage] : [self chkNoneImage]];
    
    CGICalTodoViewCheckButton *todoCheckButton = [[CGICalTodoViewCheckButton alloc] initWithTodoComponent:todoComp];
    [todoCheckButton addTarget:self action:@selector(checkButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //[todoCheckButton setImage:[todoComp hasPropertyForName:CG_ICALENDAR_PROERTY_COMPLETED] ? [self chkDoneImage] : [self chkNoneImage] forState:UIControlStateNormal];
    [todoCheckButton setTag:CG_ICALTODOVIRECONTROLLER_CELL_CHECKBUTTON_TAG];
    [todoCheckButton setFrame:CGRectMake(CG_ICALTODOVIRECONTROLLER_IMAGE_OFFSET, //cell.imageView.frame.origin.x, 
                                         CG_ICALTODOVIRECONTROLLER_IMAGE_OFFSET, //cell.imageView.frame.origin.y, 
                                         todoCheckButton.frame.size.width, 
                                         todoCheckButton.frame.size.height)];
    [cell addSubview:todoCheckButton];
    [todoCheckButton release];

    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    //[self setCheckButtonHidden:YES indexPath:indexPath];
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    NSUInteger tableCellIndexes[2];
    tableCellIndexes[0] = 0;
    for (int n=0; n<[[self todos] count]; n++) {
        tableCellIndexes[1] = n;
        [self setCheckButtonHidden:NO indexPath:[NSIndexPath indexPathWithIndexes:tableCellIndexes length:2]];
    }
    */
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        CGICalendarObject *icalObj = [self firstCalendarObject];
        CGICalendarComponent *todoComp = [[self todos] objectAtIndex:[indexPath row]];
        
        [[self todos] removeObject:todoComp];
        [icalObj removeComponent:todoComp];
        [self saveCalendar];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    if(fromIndexPath.section == toIndexPath.section) {
      if([self todos] && toIndexPath.row < [[self todos] count]) {
          CGICalendarObject *icalObj = [self firstCalendarObject];
          CGICalendarComponent *todoComp = [[self todos] objectAtIndex:[fromIndexPath row]];
          
          [[self todos] removeObject:todoComp];
          [[self todos] insertObject:todoComp atIndex:toIndexPath.row];
          
          [icalObj removeComponent:todoComp];
          [icalObj insertComponent:todoComp atIndex:toIndexPath.row];
          
          [self saveCalendar];
        }
    }
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGICalendarComponent *todoComp = [[self todos] objectAtIndex:[indexPath row]];
    CGICalTodoDetailViewController *todoDetailViewController = [[CGICalTodoDetailViewController alloc] initWithTodo:todoComp];
    [todoDetailViewController setDelegate:self];
    [[self navigationController] pushViewController:todoDetailViewController animated:YES];
    [todoDetailViewController release];
}

#pragma mark -
#pragma mark - Button Actions

- (void)doRefresh
{
    [[self tableView] reloadData];
}

- (void)doAdd
{
    CGICalendarComponent *newTodoComp = [CGICalendarComponent todo];
    CGICalTodoDetailViewController *todoDetailViewController = [[CGICalTodoDetailViewController alloc] initWithTodo:newTodoComp];
    [todoDetailViewController setDelegate:self];
    [todoDetailViewController setModalMode:YES];
    [self presentModalViewController:[[[UINavigationController alloc] initWithRootViewController:todoDetailViewController] autorelease] animated:YES];
    [todoDetailViewController release];
}

#pragma mark -
#pragma mark - CGICalTodoDetailViewController Delegate

- (void)icalTodoDetailViewController:(CGICalTodoDetailViewController *)icalTodoDetailViewController didFinished:(CGICalendarComponent *)todo
{
    CGICalendarObject *icalObj = [self firstCalendarObject];

    if ([icalObj indexOfComponent:todo] == NSNotFound)
        [icalObj addComponent:todo];
    
    [self saveCalendar];
    
    [[self tableView] reloadData];
}

- (void)icalTodoDetailViewController:(CGICalTodoDetailViewController *)icalTodoDetailViewController didCanceled:(CGICalendarComponent *)todo
{
}

#pragma mark -
#pragma mark - Check Button Action

-(void)checkButtonAction:(id)inSender
{
	CGICalTodoViewCheckButton *todoCheckButton = (CGICalTodoViewCheckButton *)inSender;
    CGICalendarComponent *todoComp = [todoCheckButton todoComponent];
    UITableViewCell *cell = (UITableViewCell *)[todoCheckButton superview];
    
    if ([todoComp hasPropertyForName:CG_ICALENDAR_PROERTY_COMPLETED]) {
        [[cell imageView] setImage:[self chkNoneImage]];
        [todoComp removePropertyForName:CG_ICALENDAR_PROERTY_COMPLETED];
    }
    else {
        [[cell imageView] setImage:[self chkDoneImage]];
        [todoComp setCompleted:[NSDate date]];
    }

    [self saveCalendar];
}

@end
