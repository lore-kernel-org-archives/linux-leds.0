From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Wed, 29 Mar 2017 12:07:25 -0700
Message-ID: <20170329190725.GN20094@minitux>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:33891 "EHLO
        mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752944AbdC2THa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Mar 2017 15:07:30 -0400
Received: by mail-pg0-f41.google.com with SMTP id 21so15876405pgg.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Mar 2017 12:07:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org

On Tue 28 Mar 19:17 PDT 2017, Rob Herring wrote:

> On Thu, Mar 23, 2017 at 09:37:49PM +0100, Pavel Machek wrote:
> > Hi!
> > 
> > > The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> > > PMICs from Qualcomm. It can operate on fixed parameters or based on a
> > > lookup-table, altering the duty cycle over time - which provides the
> > > means for e.g. hardware assisted transitions of LED brightness.
> > 
> > Ok, this is not first hardware that supports something like this. We
> > have similar hardware that can do blinking on Nokia N900 -- please
> > take a look at leds-lp55*.c
> 
> And perhaps some alignment on the bindings too if the N900 has bindings.
> 

There is a binding for ti,lp55xx, but there's nothing I can reuse from
that binding...because it's completely different hardware.

> > And it would be really good to provide hardware abstraction. We really
> > don't want to have different userspace for LPG and for N900 and for
> 
> I'm interested in what this looks like as several AOSP platforms do 
> tri-color LEDs with custom sysfs extensions.
> 

How to model RGB LEDs has been discussed many times before and I was
hoping for that discussion to come to some conclusion during the last 2
years, but now I couldn't wait more - we need this driver for db820c.

With this driver, as with many existing, you will have 3 LEDs that you
set independently.

I did implement blinking by using the PWM straight off, so you can't set
brightness or synchronize the multiple channels. Perhaps this should be
changed to use the ramp generator.

To synchronize patterns I suggest that we extend the LUT binding to
describe groups and when any LPG trigger a restart of the pattern-walker
we trigger all that are grouped.

These two changes combined allows you to set brightness and blink with a
RGB-LED.


But I will have to dig up some hardware that uses the LPG for driving a
RGB-LED to be able to test this (and I do prefer that to be done with
some incremental patches at some later time, if acceptable).

> Do any of the Dragonboards have tri-color LEDs?
> 

No.

Regards,
Bjorn
