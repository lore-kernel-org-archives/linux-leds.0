From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Mon, 3 Apr 2017 11:21:58 -0700
Message-ID: <20170403182158.GV20094@minitux>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <1192806d-13bf-3b5c-4179-b7795737ed40@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:34358 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753333AbdDCSWC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Apr 2017 14:22:02 -0400
Received: by mail-pg0-f45.google.com with SMTP id 21so128191004pgg.1
        for <linux-leds@vger.kernel.org>; Mon, 03 Apr 2017 11:22:01 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1192806d-13bf-3b5c-4179-b7795737ed40@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org

On Sun 02 Apr 05:54 PDT 2017, Jacek Anaszewski wrote:

> On 03/31/2017 11:28 AM, Jacek Anaszewski wrote:
> > Hi Bjorn and Pavel,
> > 
> > On 03/30/2017 09:43 AM, Pavel Machek wrote:
[..]
> > In both RGB and pattern approaches we should assess
> > if it is acceptable to provide a pattern for trigger name,
> > e.g. blink-pattern-{num_intervals}.
> 
> Actually we could achieve the goal by listing all available pattern
> configurations for given LED class device, so in case of Qualcomm LPG
> driver we could have transition-pattern-1 to transition-pattern-15
> listed after executing "cat trigger".
> 

There's a common pattern-table of 24 (or 64) entries, that is shared
among the 8 LPGs (each LPG simply has to indices pointing into the
shared table). Each entry in the table holds a value between 0 and 511.
So that's a lot of "available pattern configurations".

Unless you go with the path Qualcomm did in their downstream driver,
where the table is filled statically from DeviceTree and each LPG is
statically configured with some range from the table. But I don't like
this and as far as I can tell neither do you guys.

And lastly the request is to create a common interface for userspace to
control patterns among different LED hardware and I do not see how this
would be acceptable to the LP55xx users.


Perhaps I'm not getting what you're proposing?

> In case of RGB trigger we would have qcom-rgb among other triggers
> listed in a result of executing "cat trigger". Then qcom-rgb-1 LED class
> device could appear in /sys/class/leds, which would expose files
> red-led-name, green-led-name and blue-led-name. Once all files are
> initialized with appropriate LED class device names the RGB brightness
> could be updated synchronously in all involved LEDs by executing
> e.g. "echo 1 > update_color". Of course all LEDs that set qcom-rgb
> trigger would have to avoid changing device state on write to
> their brightness file.
> 

I don't see that the brightness of the individual LEDs is the problem,
writing individual colors to the 3 LEDs in a serial fashion isn't
user-noticeable. What is a problem is if you start a pulse of some
combined color it's important to synchronize the starting of the pattern
generator, of you will have a color that shifts over time - or in the
case of blink where the colors get out of sync.

And as I said, I suggest that we just make it possible to configure any
LPG channel to be grouped with any others and within a group we always
synchronize the pattern-generator when enabling any LED.


The issue left open is that we expose 3 independent LEDs to userspace
and it seems desired to expose it as a single "RGB" LED. Providing a
"RGB trigger" that any LED in the system can be associated with and then
have that trigger wrap the individual LEDs sounds like a reasonable path
forward. But if we're not going to do things like color "calibration" it
feels like we're replacing the 3 writes in userspace with a single write
and then 3 calls in the kernel; i.e. the only win in my view is some
conceptual benefit.

> I wonder if I'm not missing some vital constraints here that could
> make this design unfeasible.
> 

Regardless of how we expose RGBs to userspace, the 8 LPG hardware blocks
are independent of each other. The fact that they end up controlling
something that is perceived by the human eye as some mixed color is to
me a matter of system integration, and as such should not convolute the
implementation of the individual instances.

Regards,
Bjorn
