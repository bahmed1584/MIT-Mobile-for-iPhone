#import "LibrariesAskUsViewController.h"


@implementation TopicsMenuLibraryFormElement

+ (TopicsMenuLibraryFormElement *)formElement {
    TopicsMenuLibraryFormElement *element = [[[TopicsMenuLibraryFormElement alloc] initWithKey:@"topic"
                                                 displayLabel:@"Topic Area:"
                                                     required:YES 
                                                       values:[NSArray arrayWithObjects:
                                                               @"Art, Architecture & Planning", 
                                                               @"Engineering & Computer Science",
                                                               @"Management & Business",
                                                               @"Science",
                                                               @"Social Sciences",
                                                               @"General",
                                                               @"Circulation",
                                                               @"Technical Help",
                                                               nil]] autorelease];
    element.onChangeJavaScript = @"document.getElementById('TechHelp').style.display = (this.value == 'Technical Help') ? '' : 'none'";
    return element;
}

@end
@implementation LibrariesAskUsViewController

- (NSArray *)formGroups {
    return [NSArray arrayWithObjects:
        [LibraryFormElementGroup groupForName:@"Question" elements:[NSArray arrayWithObjects:
            [TopicsMenuLibraryFormElement formElement],
            
            [[[TextLibraryFormElement alloc] initWithKey:@"subject" 
                                            displayLabel:@"Subject line:" 
                                                required:YES] autorelease],
            
            [[[TextAreaLibraryFormElement alloc] initWithKey:@"question" 
                                            displayLabel:@"Detailed question:" 
                                                required:YES] autorelease],
                                    
            nil]],
            
         [LibraryFormElementGroup hiddenGroupForName:@"TechHelp" elements:[NSArray arrayWithObjects:
            [[[MenuLibraryFormElement alloc] initWithKey:@"on_campus"
                                             displayLabel:@"Is the problem happening on or off campus?"
                                                 required:YES 
                                                   values:[NSArray arrayWithObjects:@"on campus", @"off campus", nil] 
                                            displayValues:[NSArray arrayWithObjects:@"On campus", @"Off campus", nil]] autorelease],

            [[[MenuLibraryFormElement alloc] initWithKey:@"vpn"
                                             displayLabel:@"Are you using VPN?"
                                                 required:YES 
                                                   values:[NSArray arrayWithObjects:@"yes", @"no", nil] 
                                            displayValues:[NSArray arrayWithObjects:@"Yes", @"No", nil]] autorelease],
                                                                           
            nil]],
                                                                             
            
         [LibraryFormElementGroup groupForName:@"PersonalInfo" elements:[NSArray arrayWithObjects:
            [self statusMenuFormElementWithRequired:YES],            
            [[[TextLibraryFormElement alloc] initWithKey:@"department" displayLabel:@"Your department" required:YES] autorelease],
            [[[TextLibraryFormElement alloc] initWithKey:@"phone" displayLabel:@"Phone Number" required:NO] autorelease],
            
            nil]],
        nil];
}


- (NSString *)command {
    return @"sendAskUsEmail"; 
}

- (NSDictionary *)formValues {
    NSMutableDictionary *values = [NSMutableDictionary dictionaryWithDictionary:[super formValues]];
    [values setObject:@"form" forKey:@"ask_type"];
    return values;
}

@end
