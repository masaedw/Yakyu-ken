//
//  Yakyu_kenViewController.h
//  Yakyu-ken
//
//  Created by noid on 6/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//


#import <UIKit/UIKit.h>

#define GU 0
#define TY 1
#define PA 2

@interface Yakyu_kenViewController : UIViewController {
	IBOutlet UIButton *btn_g;
	IBOutlet UIButton *btn_t;
	IBOutlet UIButton *btn_p;
	IBOutlet UIButton *btn_restart;
	IBOutlet UILabel *beforetitle;
	IBOutlet UILabel *aftertitle;
	IBOutlet UILabel *rslt;
	IBOutlet UILabel *other;
	IBOutlet UIImageView *win;
	IBOutlet UIImageView *lose;
	IBOutlet UIImageView *ready;
	IBOutlet UIImageView *even;
	NSString *s_gtp[3];
	UIButton *b_gtp[3];
}

@property(nonatomic,retain) UIButton *btn_g;
@property(nonatomic,retain) UIButton *btn_t;
@property(nonatomic,retain) UIButton *btn_p;
@property(nonatomic,retain) UIButton *btn_restart;
@property(nonatomic,retain) UILabel *beforetitle;
@property(nonatomic,retain) UILabel *aftertitle;
@property(nonatomic,retain) UILabel *rslt;
@property(nonatomic,retain) UILabel *other;
@property(nonatomic,retain) UIImageView *win;
@property(nonatomic,retain) UIImageView *lose;
@property(nonatomic,retain) UIImageView *ready;
@property(nonatomic,retain) UIImageView *even;

-(IBAction) btn_g_down:(id) sender;
-(IBAction) btn_t_down:(id) sender;
-(IBAction) btn_p_down:(id) sender;
-(IBAction) btn_restart_down:(id) sender;

-(void) janken:(NSInteger) gtp;
-(void) j_aiko;
-(void) j_win:(NSInteger) gtp;
-(void) j_lose:(NSInteger) gtp;

@end

