From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Sun, 9 Apr 2017 14:32:18 +0200
Message-ID: <57efaf4f-c875-ffe8-1af1-dca854261870@gmail.com>
References: <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux> <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux> <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <20170403190032.GX20094@minitux>
 <dce7f2b1-8d1d-1c5d-5fa5-54c22b6f4758@gmail.com>
 <20170407202603.GC15143@minitux> <20170408133904.GA9020@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170408133904.GA9020@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 04/08/2017 03:39 PM, Pavel Machek wrote:
> Hi!
> 
>> [..]
>>>> For the patterns I don't know how a trigger for this would look like,
>>>> how would setting the pattern of a trigger be propagated down to the
>>>> hardware?
>>>
>>> We'd need a new op and API similar to blink_set()/led_blink_set().
>>>
>>
>> I've tried to find different LED circuits with some sort of pattern
>> generator in an attempt to figure out how to design this interface, but
>> turned out to be quite hard to find examples; the three I can compare
>> are:
>>
>> * LP5xx series "implements" pattern generation by executing code.
>>
>> * Qualcomm LPG iterates over 2-64 brightness-values in a pattern, at a
>>   fixed rate with knobs to configure what happens before starting and
>>   after finishing iterating over the defined values. It does not support
>>   smooth transitions between values.
>>
>> * AS3676 supports a pattern of 32 values controlling if the output
>>   should be enabled or disabled for each 32.5ms (or 250ms) time period.
>>   The delay before repeating the pattern can be configured. It support
>>   smooth transitions between the states.
>>
>>
>> So, while I think I see how you would like to architect this interface I
>> am not sure how to figure out the details.
>>
>> The pattern definition would have to be expressive enough to support the
>> features of LP5xx and direct enough to support the limited AS3676. It
>> would likely have to express transitions, so that the LPG could generate
>> intermediate steps (and we will have to adapt the resolution of the
>> ramps based on the other LPGs in the system).
>>
>> How do we do with patterns that are implementable by the LP5xx but are
>> not with the LPG? Should we reject those or should we do some sort of
>> best-effort approach in the kernel?
> 
> Lets say you get series of
> 
> (red, green, blue, delta_t )

In order to make it possible we'd have to have a means for mapping
LED class devices to red, green and blue. In effect I see the problem
of introducing a new mechanism for creating compound LED class device
out of existing LED class devices as the first one to address.

Once we have compound LED class device, that would expose an interface
for operating on the particular color brightnesses, then we can build
upon it the pattern engine. Actually, the same compound LED mechanism
would be necessary for defining blink patterns for strings of monochrome
LEDs.

> points, meaning "in delta_t msec, change color to red, green,
> blue. Lets ignore other channels for now. delta_t of 0 would be step
> change. Would such interface work for you?
> 
> Simple compiler from this to LP5XX code should not be hard to
> do. AS3676 ... I'm not sure what to do, AFAICT it is too limited.

Our new API for setting blink patterns could be defined so that it
does not guarantee setting the requested pattern, but applies only
what the hardware can support and returns the applied settings.
E.g. this way the driver could reduce the requested brightness
transition resolution.

There is also a question if we should provide software fallback
for patterns not supported by the hardware and to what extent.
In case of blink support for a single LED we do that but in case
of more complex patterns it would require more complex logic,
and at least for now I'd avoid it.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
