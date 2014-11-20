From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add attributes neccessary for LED flashes to
 devicetree/bindings/leds/common.txt
Date: Thu, 20 Nov 2014 20:19:19 +0100
Message-ID: <20141120191919.GA9756@amd>
References: <20141120131713.GC27527@amd>
 <546DEEC3.7090508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49134 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755664AbaKTTTW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 20 Nov 2014 14:19:22 -0500
Content-Disposition: inline
In-Reply-To: <546DEEC3.7090508@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: sakari.ailus@iki.fi, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net

On Thu 2014-11-20 14:38:11, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 11/20/2014 02:17 PM, Pavel Machek wrote:
> >
> >Add attributes neccessary for LED flashes to
> >devicetree/bindings/leds/common.txt .
> >
> >This will allow me to add device tree support for adp1653 i2c flash
> >LED driver, and allow Jacek Anaszewski to add support for more LED
> >drivers..
> >
> >Signed-off-by: Pavel Machek <pavel@ucw.cz>
> >
> >diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> >index 2d88816..e9acbbc 100644
> >--- a/Documentation/devicetree/bindings/leds/common.txt
> >+++ b/Documentation/devicetree/bindings/leds/common.txt
> >@@ -14,6 +14,15 @@ Optional properties for child nodes:
> >       "ide-disk" - LED indicates disk activity
> >       "timer" - LED flashes at a fixed, configurable rate
> >
> >+- max-microamp : maximum intensity in microamperes of the LED
> >+  	         (torch LED for flash devices)
> >+- flash-max-microamp : maximum intensity in microamperes of the
> >+                       flash LED; it is mandatory if the LED should
> >+		       support the flash mode
> >+- flash-timeout-microsec : timeout in microseconds after which the flash
> >+                           LED is turned off
> >+
> >+
> >  Examples:
> >
> >  system-status {
> >@@ -21,3 +30,10 @@ system-status {
> >  	linux,default-trigger = "heartbeat";
> >  	...
> >  };
> >+
> >+camera-flash {
> >+	label = "Flash";
> >+	max-microamp = <50000>;
> >+	flash-max-microamp = <320000>;
> >+	flash-timeout-microsec = <500000>;
> >+}
> >
> 
> Why did you omit indicator-pattern?

Well, I think its going to be device specific, and it was not
specified well enough -- and I believe it needs more discussion.

Indicator pattern would be basically some sequence of intensities in
time, right?

And your hardware has some preset number of patterns it can do...?

There's a controller for 3-color LED in n900, and it takes programs
for patterns. So I for example had a program that computed prime
numbers and then blinked them on the LED, independently of the main
CPU.

So yes, patterns would be useful, but no, I don't know how to do them
in generic way, and thus would prefer to avoid defining them in
generic binding.

									Pavel



-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
