//=================================================================================
// GCam 2.0 Configuration
//
//=================================================================================
// Main Parameter

// Move Speed ( Recommended 0.0-1.0 )
#define CFMOVE 0.8

// Turn Speed ( Recommended 0.0-1.0 )
#define CFTRK 0.3

// Zoom Speed ( Recommended 0.0-1.0 )
#define CFWHEEL 0.3

// Show unit type in Unit List and Map. ( true | false )
#define LISTFRIENDLY true
#define LISTENEMY true
#define LISTCIVILIAN true
#define LISTANIMAL true

// Radius distance to which units is listed in Unit List and groups showed in Map.
// ( Recommended 1000-3000, viewDistance is graphic option value )
#define DETECTOBJECTDISTANCE viewDistance

// Enable / disable notify text when mode is switches. ( true | false )
#define SHOWNOTICETEXT true

// Enable / disable notify unit name when unit is switches. ( true | false )
#define SHOWUNITNAME true

// Enable / disable following unit radio massage in GCam View. ( true | false )
#define RADIOMESSAGE false

// Smoothly unit switching movement. ( true | false )
#define SWITCHSMOOTH true

// Camera and unit distance adjusts with unit size after unit switches. ( true | false )
#define SWITCHADJDIS true

// The unit shows up in screen center after unit switches. ( true | false )
#define SWITCHCENTER false

// Enable / disable accTime function. ( true | false )
// accTime is changed in Unit List.
#define SHOWTIMEACC true

// Enable / disable warhead and ejected unit chasing function. ( true | false )
// Chase trigger is set in Unit List or T key.
#define SHOWTRIGGER true

// Enable / disable camera shake effect when warhead chasing. ( true | false )
#define CHASECAMERASHAKE true

// Change time speed when warhead chasing. ( 0.1 - 4.0 )
#define CHASEACCTIME 1.0

// Limitation player ends GCam. ( true | false )
// GCam can be ended only by commanding GCamKill = true.
// This option is for MP use.
#define LIMITQUIT false

// For enabling Parameter Tracking Mode, cancel comment out the PARAMTRACK line.
// Parameter Tracking Mode is a selective function which displays many parameters to the unit in real time.
// Arbitrary commands in input columns can be run at any time.
//#define PARAMTRACK


//=================================================================================
// Keybind

// Camera Move Front ( default : 17 )
#define KEYMOVEFRONT 17

// Camera Move Back ( default : 31 )
#define KEYMOVEBACK 31

// Camera Move Left ( default : 30 )
#define KEYMOVELEFT 30

// Camera Move Right ( default : 32 )
#define KEYMOVERIGHT 32

// Camera Move Up ( default : 16 )
#define KEYMOVEUP 16

// Camera Move Down ( default : 44 )
#define KEYMOVEDOWN 44

// Camera Move Straight Front ( default : 3 )
#define KEYMOVESTRFRONT 3

// Camera Move Straight Back ( default : 45 )
#define KEYMOVESTRBACK 45

// Toggle Follow Mode ( default : 33 )
#define KEYMODEFOLLOW 33

// Toggle Behind Mode ( default : 48 )
#define KEYMODEBEHIND 48

// Toggle Focus Mode ( default : 46 )
#define KEYMODEFOCUS 46

// Toggle Firing Trigger ( default : 20 )
#define KEYMODETRIGGER 20

// Change Camera View Mode ( default : 47 )
#define KEYMODEVIEW 47

// Unit Switch Next ( default : 200 )
#define KEYUNITNEXT 200

// Unit Switch Previous ( default : 208 )
#define KEYUNITPREVIOUS 208

// Group Switch Next ( default : 205 )
#define KEYGROUPNEXT 205

// Group Switch Previous ( default : 203 )
#define KEYGROUPPREVIOUS 203

// Night / Thermal Visions ( default : 49 )
#define KEYFLIR 49

// Open / Close List ( default : 38 )
#define KEYLIST 38

// Quit ( default : 57 )
#define KEYQUIT 57

// Parameter Tracking Mode Command 1 ( default : 59 )
#define KEYPTMCOM1 59

// Parameter Tracking Mode Command 2 ( default : 60 )
#define KEYPTMCOM2 60

// Parameter Tracking Mode Command 3 ( default : 61 )
#define KEYPTMCOM3 61

// Parameter Tracking Mode Command 4 ( default : 62 )
#define KEYPTMCOM4 62


//=================================================================================
// Advanced Parameter

// Initial Camera Mode Enable/Disable Statement
#define INITFOLLOWMODE true
#define INITBEHINDMODE true
#define INITFOCUSMODE true

// Initial Camera Position
#define INITCAMDISY 7.5
#define INITCAMDISZ 2.5
#define INITCAMAGL -8
#define INITCAMZOOM 0.7

// Mouse Move Parameter
#define MOUSEMOVEACCX 0.9
#define MOUSEMOVEACCY 2.6

// Mouse Drag Parameter
#define MOUSEDRAGACCX 1.35
#define MOUSEDRAGACCY 3.9

// Attenuation Coefficient of Camera Movement
#define MOVEATTEN 0.8
#define TURNATTEN 0.8
#define ZOOMATTEN 0.8

// Behind Mode Parameter
#define BEHINDSPDAROUND 0.056
#define BEHINDSPDROTATE 2.7

// Smooth Switch Parameter
#define SWITCHSPEED 510

// Map Update Interval
#define MAPUPDATEINTERVAL 20

// Parameter Tracking Mode Parameter
#define PARAMTRACKINTERVAL 7
#define PARAMTRACKINITCODE1 "setAccTime 0"
#define PARAMTRACKINITCODE2 "setAccTime 1"
#define PARAMTRACKINITCODE3 "copyToClipboard ctrlText(findDisplay 5100 displayCtrl 25)"
#define PARAMTRACKINITCODE4 ""


//=================================================================================
// GUI Parameter
// For more detailed GUI definition, edit directly gcam_component.hpp.

// Outside Space
#define OUTFRAME 0.025

// Space of Each Button
#define SPACE 0.01

// List Size
#define LISTWIDTH 0.2735
#define LISTHEIGHT 0.2735

// List Items Color
#define COLORLISTFOLLOWGROUP [ 0.8, 0.8, 0.7, 1.00 ]
#define COLORLISTFRIENDLY [ 0.259, 0.663, 0.953, 1.000 ]
#define COLORLISTENEMY [ 0.95, 0.48, 0.38, 1.00 ]
#define COLORLISTCIVILIAN [ 0.85, 0.65, 0.30, 1.0 ]
#define COLORLISTANIMAL [0.35,0.75,0.35,1]

// Initial Map Size
#define INITMAPSIZE 0.2735

// Map Markers Color
#define COLORSCANAREA "ColorOrange"
#define COLORICONCAMERA "ColorBlack"
#define COLORICONFRIENDLY "ColorBlue"
#define COLORICONENEMY "ColorRed"
#define COLORICONCIVILIAN "ColorOrange"
#define COLORICONANIMAL "ColorGreen"

// Button and Button Font Size
#define BUTTONWIDTH 0.0845
#define BUTTONHEIGHT 0.0350
#define BUTTONFONTSIZE 0.0350

// Button Text Color
#define COLORBUTTONTEXTOFF [ 0.874, 0.843, 0.647, 1.000 ]
#define COLORBUTTONTEXTON [ 1.0, 0.35, 0.25, 1.0 ]


//=================================================================================
