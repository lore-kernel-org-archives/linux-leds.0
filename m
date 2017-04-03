From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Mon, 3 Apr 2017 22:38:27 +0200
Message-ID: <1ec19e46-0a01-b8e4-5651-797b94bd342b@gmail.com>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd> <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux> <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux> <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <1192806d-13bf-3b5c-4179-b7795737ed40@gmail.com>
 <20170403182158.GV20094@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403182158.GV20094@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 04/03/2017 08:21 PM, Bjorn Andersson wrote:
> On Sun 02 Apr 05:54 PDT 2017, Jacek Anaszewski wrote:
> 
>> On 03/31/2017 11:28 AM, Jacek Anaszewski wrote:
>>> Hi Bjorn and Pavel,
>>>
>>> On 03/30/2017 09:43 AM, Pavel Machek wrote:
> [..]
>>> In both RGB and pattern approaches we should assess
>>> if it is acceptable to provide a pattern for trigger name,
>>> e.g. blink-pattern-{num_intervals}.
>>
>> Actually we could achieve the goal by listing all available pattern
>> configurations for given LED class device, so in case of Qualcomm LPG
>> driver we could have transition-pattern-1 to transition-pattern-15
>> listed after executing "cat trigger".
>>
> 
> There's a common pattern-table of 24 (or 64) entries, that is shared
> among the 8 LPGs (each LPG simply has to indices pointing into the
> shared table). Each entry in the table holds a value between 0 and 511.
> So that's a lot of "available pattern configurations".

By "available pattern configurations" I meant the number of possible
"pattern resolution" options, E.g. an equivalent of

echo "40 71 12" > pattern

would be

echo transition-pattern-3 > trigger

and then pattern_intervals directory with three files would
be created: interval_1, interval_2, interval_3.

In the next steps the user would have to write 40, 71 and 12
to interval_(1, 2, 3) respectively.

Now it is clear that initialization of such a trigger would
be cumbersome. One file accepting space separated list of values
should be fine.

> Unless you go with the path Qualcomm did in their downstream driver,
> where the table is filled statically from DeviceTree and each LPG is
> statically configured with some range from the table. But I don't like
> this and as far as I can tell neither do you guys.

Right, what we're trying to implement is flexible sysfs interface.

> And lastly the request is to create a common interface for userspace to
> control patterns among different LED hardware and I do not see how this
> would be acceptable to the LP55xx users.

For that we will certainly need some additions to the LED Trigger core.
We will need to limit usage of certain type of triggers only among
specified LED class devices, to allow assigning them to pattern engines.

We will also need a new op, similarly to existing blink_set().

The question is whether we will be providing software fallbacks,
and to what extent.

> Perhaps I'm not getting what you're proposing?

Yeah, after going through Documentation/leds/leds-lp55xx.txt and friends
it looks like we will need really sophisticated mechanism.
I'm not sure if providing generic interface for all use cases
documented there makes sense.

>> In case of RGB trigger we would have qcom-rgb among other triggers
>> listed in a result of executing "cat trigger". Then qcom-rgb-1 LED class
>> device could appear in /sys/class/leds, which would expose files
>> red-led-name, green-led-name and blue-led-name. Once all files are
>> initialized with appropriate LED class device names the RGB brightness
>> could be updated synchronously in all involved LEDs by executing
>> e.g. "echo 1 > update_color". Of course all LEDs that set qcom-rgb
>> trigger would have to avoid changing device state on write to
>> their brightness file.
>>
> 
> I don't see that the brightness of the individual LEDs is the problem,
> writing individual colors to the 3 LEDs in a serial fashion isn't
> user-noticeable. What is a problem is if you start a pulse of some
> combined color it's important to synchronize the starting of the pattern
> generator, of you will have a color that shifts over time - or in the
> case of blink where the colors get out of sync.

I had exactly these use cases on mind.

> And as I said, I suggest that we just make it possible to configure any
> LPG channel to be grouped with any others and within a group we always
> synchronize the pattern-generator when enabling any LED.

IMHO it would be useful to have also specialized RGB trigger. Then we
could call led_rgb_event() from any place in kernel and be sure that
all groups of three R,G,B LED class devices, registered on that trigger,
will get new brightness.

We have two concepts here: trigger and grouping LED class device into
a single one. In the latter case such a device could be registered on
any trigger from current mainline and all grouped LEDs would get the
same brightness (e.g. as a result of backlight event).

> The issue left open is that we expose 3 independent LEDs to userspace
> and it seems desired to expose it as a single "RGB" LED. Providing a
> "RGB trigger" that any LED in the system can be associated with and then
> have that trigger wrap the individual LEDs sounds like a reasonable path
> forward. But if we're not going to do things like color "calibration" it
> feels like we're replacing the 3 writes in userspace with a single write
> and then 3 calls in the kernel; i.e. the only win in my view is some
> conceptual benefit.

You have one syscall vs three syscalls. The synchronization is the main
target here.

>> I wonder if I'm not missing some vital constraints here that could
>> make this design unfeasible.
>>
> 
> Regardless of how we expose RGBs to userspace, the 8 LPG hardware blocks
> are independent of each other. The fact that they end up controlling
> something that is perceived by the human eye as some mixed color is to
> me a matter of system integration, and as such should not convolute the
> implementation of the individual instances.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
