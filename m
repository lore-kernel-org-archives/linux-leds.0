From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH] leds: multicolor: Add sysfs interface definition
Date: Wed, 30 Jan 2019 15:07:46 -0600
Message-ID: <138450e2-9082-6986-a89b-0028dca0d365@ti.com>
References: <20190130183005.833-1-dmurphy@ti.com>
 <f3792d44-1a43-318b-1b12-d6d69275c3a8@gmail.com>
 <333a146a-a469-5b72-5e81-ff7f522dc598@ti.com>
 <c65ca84d-8054-2244-1899-e4a9cb0842da@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c65ca84d-8054-2244-1899-e4a9cb0842da@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 1/30/19 2:20 PM, Jacek Anaszewski wrote:
> Dan,
> 
> On 1/30/19 8:59 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 1/30/19 1:37 PM, Jacek Anaszewski wrote:
>>> Hi Dan,
>>>
>>> Thank you for the RFC.
>>>
>>> One vital thing is missing - documentation of brightness file must
>>> be updated to define its semantics for LED multi color class.
>>>
>>> Either we need brightness-model file returning only "onoff" option
>>> available, or, for time being, fix the max_brightness for LED multi
>>> color class to 1 (which will map to max intensity level for each color).
>>>
>>
>> I can make max_brightness default to 1 if not set by the LED driver.
>>
>> But the LP50xx has brightness controls so setting max_brightness from the driver should over ride
>> the max of 1 in the upper level.
> 
> Yes, so the max_brightness should be updated basing on current
> brightness-model. For LEDn_BRIGHTNESS of LP50xx we could have
> "hw" or maybe even better just "lp50xx-linear" and "lp50xx-logarithmic"
> - I just forgot about that capability of the device.
> 

OK maybe "hw" would make sense as there may be other devices that have dedicated brightness controls
over color controls.

Probably need to create a model for non-modeled cases like "rgb-independent".  Dumb name but I could not
think of anything better.

>> For devices that do not support brightness as a separate control we can create a file called
>> max_brightness_<color> that defines the max that a specific color can be set to.  If max_brightness
>> is set to 1 then create max_brightness_<color>.  If max_brightness > 1 then do not create the files.
> 
> Right. We will need dedicated max_brightness for each color.
> They should be placed also in the colors directory, next to the color
> files.
> 

OK will document this.

>> I don't think we have fully vetted the brightness-model yet so I prefer to omit
>> it and possibly introduce that later.
> 
> We need to start from something. It will give better overview of the
> whole idea.
> 

OK.  Don't get me wrong I don't oppose this idea I am just trying to figure out how the user space would
know what models and brightness levels are available.

I mean we can read the brightness-models and present the available models but then how does the user know
what and how many levels are in each model?  And how do we govern putting them in the right order?

The DT file can get messed up, per the previous example
rgb-green = <0x277c33 0x37b048 0x47e45d>; 

This is assumed to be from dimmest to brightest.  But that is just an assumption

What if the entry looked like this?
rgb-green = <0x37b048 0x277c33 0x47e45d>; 

Then echo 1 > brightness is not really a lower intensity then echo 2 > brightness.
I know this is a product level issue but this can be misused and there is no way for maintainers
or reviewers to really catch this error in code reviews.

The driver can map the brightness to the appropriate level requested by the class but again not
sure how the user space can know what is available.  And there is nothing from stopping a
definition of up to 2^32 brightness combinations.  This I know is unrealistic but the capability is there

I am wondering if there should be some sort of coefficient that can be defined that is 
applied to each color (no complex math).  I can see this working in a linear device but logrithimic
maybe an issue.

Like

rgb-green = <0x277c33>;  //Coefficient used to set the dimmest allowed brightness for the color model.

echo 1 > brightness

red = 0x27
green = 0x7c
blue = 0x33

echo 2 > brightness

red = 0x28
green = 0x7d
blue = 0x34

echo 3 > brightness

red = 0x29
green = 0x7e
blue = 0x35

This example would give you 132 different brightness levels. green is the brightest defined color so the step calculation is 

255-124+1 = 132 (zero based) as 0 is off.

There can be a file called rgb_green_max which can be read to indicate how many brightness levels can be achieved.
If the user goes beyond the steps then throw -EINVAL at them.

These brightness models probably should be put into a separate directory to isolate and not clutter the colors directory.
And writing brightness to these models would be immediate no sync involved.

Dan

> Best regards,
> Jacek Anaszewski
> 
>> Dan
>>

<snip>-- 
------------------
Dan Murphy
