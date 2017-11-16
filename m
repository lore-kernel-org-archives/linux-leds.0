From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Thu, 16 Nov 2017 15:42:12 -0600
Message-ID: <16189eab-5541-9550-c027-1c9d2b5fa6d7@ti.com>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <cb5c5a65-d5a0-86a3-36b4-cf06baae9ec4@gmail.com>
 <0a78c883-f074-cc19-3c0c-fc05607400e9@ti.com> <20171115222323.GA18290@amd>
 <82336eb7-2b89-d37b-d688-4e4302766346@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <82336eb7-2b89-d37b-d688-4e4302766346-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Jacek

On 11/16/2017 02:14 PM, Jacek Anaszewski wrote:
> Hi Dan and Pavel,
> 
> On 11/15/2017 11:23 PM, Pavel Machek wrote:
>> Hi!
>>
>>>> Shouldn't the driver be targeted for backlight subsystem then?
>>>>
>>>> Adding backlight maintainers.
>>>>
>>>
>>> Great point!  I was not aware of the backlight subsystem.
>>>
>>> Looks like I need to create a back light version as well.
>>>
>>> Like the lp8788 did since this can be used as a LED driver beyond
>>> display back lighting.
>>
>> No, definitely not two drivers for lp8788 hardware.
> 
> I agree.
> 
>> If that does not yet exist... you want to create glue layer to be able
>> to use LED as a display backlight. (It may already exist, no idea).
>>
>> ...
>>
>> Actually or maybe a LED trigger. Just set LED's trigger to "this is
>> display backlight".
> 
> There is one already:
> 
> drivers/leds/trigger/ledtrig-backlight.c
> 
> It adds a LED class device to the fb_notifier_list
> (drivers/video/fbdev/core/fb_notify.c)
> 
> using fb_register_client(). The same is used in
> backlight_device_register (drivers/video/backlight/backlight.c).
> 
> Actually why do you want to have this driver in the LED subsystem,
> if it is advertised as "designed for LCD display backlighting"?

Well this is also advertised as a driver for Smart phone and tablet devices.  And having worked with the Android lighting
solutions this is the preferred subsystem for Android.  The Android OS manages the led brightness based on ALS values and in
turn calls into the driver to control the brightness register through the vendor provided lighting HAL.

I am going to look at the backlight source to figure out how to get the same functionality using the backlight subsystem.
Otherwise I will plug in this driver to the backlight subsystem through the notifier.

> 
> As a side note I can say that I've been always wondering why the two
> subsystems for similar type of hardware.

This is my worry too.  Why do we need both subsystems to do the same thing?

I don't see either having one advantage over the other.


Dan
> 


-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
