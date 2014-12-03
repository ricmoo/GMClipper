# GMClipper

This is still a complete **work in progress**. I have barely tested it yet, just placing it in github for safe keeping. It's also my first foray into creating a cocoapod. So, you probably really shouldn't try using it yet. More and better documentation will come.

## Features

- Perform boolean (union, intersection, difference, xor) operations on sets of polygons.
- Enlarge or shrink polygons
- Simplify and clean-up polygons
- Fast and simple library


## Adding to Your Project

To use this library, simply copy the files in Pod/Classes into your project, and everything should *just work*. (CocoaPods coming soon)

## API

### Clipping

Clipping allows you to take one set of polygons (the subject) and clip it against another set of polygons (the clipping region).

Examples:
- to only display the complete shapes and parts of complex shapes within a viewport of a larger canvas
- to detect if an item in an island game is actually completely on a set of islands 
- to perform general boolean operators on a series of overlapping shapes, like Adobe Illustrator's Path Finder

To clip, simple define your shape(s) and clip:

```objc
#import "GMClipper.h"

// Create a subject polygon
GMPolygon *subject = [GMPolygon polygon];
[subject addPointX:0 y:0];
[subject addPointX:100 y:100];
[subject addPointX:100 y:0];

// Create a clipping polygon (50x50 rectangle)
GMPolygon *clipping = [GMPolygon polygon];
[clipping addPointX:0 y:0];
[clipping addPointX:0 y:50];
[clipping addPointX:50 y:50];
[clipping addPointX:50 y:0];

// Prepare the subject with the clipping polygon for clipping
GMClipper *clipper = [GMClipper clipper];
[clipper addSubjectPolygon:subject];
[clipper addClippingPolygon:clipping];

// Compute the new polygon(s)
NSArray *result = [clipper executeClipType:ClipTypeIntersection];

NSLog(@"Result: %@", result);
```

### Offsetting

Offsetting allows you to grow or shrink a polygon.

Examples:
- to add a border around a complicated shape
- to compute a polygon's stroke's region, you could subtract a shrunk polygon from its enlarged polygon

To enlarge a shape, use a positive distance, to shrink it, use a negative distance.

```objc
#import "GMClipperOffset"

// Create a triangle
GMPolygon *triangle = [GMPolygon polygon];
[triangle addPointX:0 y:0];
[triangle addPointX:100 y:100];
[triangle addPointX:100 y:0];

// Prepare the triangle for enlarging (or shrinking)
GMClipperOffset *clipperOffset = [GMClipperOffset clipperOffset];
[clipperOffset addPolygon:triangle joinType:JoinTypeSquare endType:EndTypeClosedPolygon];

// Compute the triangle enlarged by 10 points
NSArray *result = [clipperOffset executeDelta:10];

NSLog(@"Result: %@", result);
```

## FAQ

### License?

GMClipper is available under the "Boost Software License". Basically:
- if you distribute *source*, include license
- if you distribute *compiled code*, **no need**

I usually release things under the MIT License, however, I am wrapping an existing library, so this keeps things simple.

See the LICENSE file for more info.

### Have a question?

E-mail me at me@ricmoo.com.

