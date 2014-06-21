//
//  TweetSheetViewController.m
//  Tsubu
//
//  Created by 丸川大輝 on 2014/06/20.
//  Copyright (c) 2014年 丸川大輝. All rights reserved.
//

#import "TweetSheetViewController.h"

@interface TweetSheetViewController ()

@property (nonatomic , strong) TweetSheetViewController *tweetTextView;

@end

@implementation TweetSheetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editEndAction:(id)sender{ //編集終了時
    [self.tweetTextView resignFirstResponder]; //キーボードを引っ込める
}

- (IBAction)tweetAction:(id)sender{
    ACAccountStore *accountStore = [[ACAccountStore alloc]init];
    ACAccount *account = [accountStore accountWithIdentifier:self.identifier];
    NSString *tweetString = self.tweetTextView.text;
    
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com" @"/1.1/statuses/update.json"];
    //NSURL *url = [NSURL URLWithString:@"https://api.twitter.com" @"/1.1/statuses/update_with_media.json"]; //画像付きの場合
    
    NSDictionary *params = @{@"status" : tweetString};
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodPOST URL:url parameters:params];
    //UIImage *image = [UIImage imageNamed:@"testIcon.png"];//画像付きの場合
    //NSData *imageData = UIImageJPEGRepresentation(image,1.f);//画像がJPEGファイルの場合
    //NSData *imageData = UIImagePNGRepresentation(image);//以下は画像がPNGファイルの場合
    //[request addMultipartData:imageData withName:@"media[]"; type:@"image/png" filename:@"testIcon.png"];
    request.account = account;
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse , NSError *error){
        if (responseData) {
            self.httpErrorMessage = nil;
            if (urlResponse.statusCode >= 200 && urlResponse.statusCode < 300) {
                NSDictionary *postResponseData = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:NULL];
                NSLog(@"SUCCESS! created tweet with ID:%@",postResponseData[@"id_str"]);
            } else {
                self.httpErrorMessage = [NSString stringWithFormat:@"The response status code is %d" , urlResponse.statusCode];
                NSLog(@"HTTP Error:%@",self.httpErrorMessage);
            } else {
                NSLog(@"ERROR: An error occurred while posting: %@",[error localizedDescription]);
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                UIApplication *application = [UIApplication sharedApplication];
                application.networkActivityIndicatorVisible = NO;
                [self dismissViewControllerAnimated:YES completion:^{
                    NSLog(@"Tweet Sheet has been dismissed");
                }];
            });
        }];
    }
     
     - (IBAction)cancelAction:(id)sender){
         [self dismissViewControllerAnimated:YES completion:^{
             NSLog(@"Tweet Sheet has been dismissed.");
         }
          ];
     }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
