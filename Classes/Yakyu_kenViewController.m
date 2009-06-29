//
//  Yakyu_kenViewController.m
//  Yakyu-ken
//
//  Created by noid on 6/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Yakyu_kenViewController.h"

@implementation Yakyu_kenViewController

@synthesize btn_g, btn_t, btn_p, btn_restart;
@synthesize beforetitle, aftertitle, rslt, other;
@synthesize win, lose, ready, even;

-(IBAction) btn_restart_down:(id) sender {
	self.btn_g.hidden = NO;
	self.btn_g.enabled = YES;
	self.btn_t.hidden = NO;
	self.btn_t.enabled = YES;
	self.btn_p.hidden = NO;
	self.btn_p.enabled = YES;
	self.btn_restart.hidden = YES;
	self.aftertitle.hidden = YES;
	self.rslt.text = @"";
	self.other.text = @"";
	self.win.hidden = YES;
	self.lose.hidden = YES;
	self.ready.hidden = NO;
	self.even.hidden = YES;
}

// ぐー
-(IBAction) btn_g_down:(id) sender {
	[self janken:GU];
}

// ちょき
-(IBAction) btn_t_down:(id) sender {
	[self janken:TY];
}

// ぱー
-(IBAction) btn_p_down:(id) sender {
	[self janken:PA];
}

-(void) janken: (NSInteger) gtp {
	self.aftertitle.hidden = NO;
	NSInteger result = random() % 3;
	switch (result) {
		case 0:
			[self j_aiko];
			break;
		case 1:
			[self j_win:gtp];
			break;
		case 2:
			[self j_lose:gtp];
			break;
	}
}

-(void) j_aiko {
	self.rslt.text = @"あいこで...";
	self.btn_g.hidden = NO;
	self.btn_t.hidden = NO;
	self.btn_p.hidden = NO;
	self.btn_g.enabled = YES;
	self.btn_t.enabled = YES;
	self.btn_p.enabled = YES;
	self.btn_restart.hidden = YES;
	self.win.hidden = YES;
	self.lose.hidden = YES;
	self.ready.hidden = YES;
	self.even.hidden = NO;
}

-(void) j_win: (NSInteger) gtp {
	self.rslt.text = @"You Win!";
	self.other.text = s_gtp[(gtp+1)%3];

	for (NSInteger i = 0; i < 3; i++) {
		b_gtp[i].hidden = (i == gtp) ? NO : YES;
		b_gtp[i].enabled = NO;
	}

	self.btn_restart.hidden = NO;
	self.btn_restart.enabled = YES;
	self.win.hidden = NO; 
	self.lose.hidden = YES; 
	self.ready.hidden = YES; 		
	self.even.hidden = YES;
}

-(void) j_lose: (NSInteger) gtp {
	self.rslt.text = @"You Lose!";
	self.other.text = s_gtp[(gtp+2)%3];

	for (NSInteger i = 0; i < 3; i++) {
		b_gtp[i].hidden = (i == gtp) ? NO : YES;
		b_gtp[i].enabled = NO;
	}

	self.btn_restart.hidden = NO;
	self.btn_restart.enabled = YES;
	self.win.hidden = YES;
	self.lose.hidden = NO;
	self.ready.hidden = YES;
	self.even.hidden = YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		srandom(time(nil));
		s_gtp[GU] = @"ぐー";
		s_gtp[TY] = @"ちょき";
		s_gtp[PA] = @"ぱー";
	}
	return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.aftertitle.hidden = YES;
	self.rslt.text = @"";
	self.other.text = @"";
	self.btn_restart.hidden = YES;
	
//	win = [[UIImage imageNamed:@"win"] retain];
//	lose = [[UIImage imageNamed:@"lose"] retain];
//	ready = [[UIImage imageNamed:@"ready"] retain];
	self.win.hidden = YES;
	self.lose.hidden = YES;
	self.ready.hidden = NO;
	self.even.hidden = YES;

	b_gtp[GU] = btn_g;
	b_gtp[TY] = btn_t;
	b_gtp[PA] = btn_p;
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[btn_g release];
	[btn_t release];
	[btn_p release];
	[btn_restart release];
	[beforetitle release];
	[aftertitle release];
	[rslt release];
	[other release];
	[win release];	
	[lose release];
	[ready release];
	[even release];
	[s_gtp[GU] release];
	[s_gtp[TY] release];
	[s_gtp[PA] release];
	[super dealloc];
}

@end
