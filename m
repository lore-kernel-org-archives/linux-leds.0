From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RESEND v6 0/2] Driver for TI tlc591xx 8/16 Channel i2c
 LED driver
Date: Mon, 17 Aug 2015 15:27:18 +0200
Message-ID: <20150817132718.GF7537@lunn.ch>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
 <55D1CF84.8040906@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:60616 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751725AbbHQNeh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 17 Aug 2015 09:34:37 -0400
Content-Disposition: inline
In-Reply-To: <55D1CF84.8040906@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matthew.Fatheree@belkin.com

On Mon, Aug 17, 2015 at 03:11:48PM +0300, Tomi Valkeinen wrote:
> Hi Andrew, (and Brian),
> 
> On 18/03/15 00:08, Andrew Lunn wrote:
> > This patchset is a driver for the TI tlc59116 16 Channel i2c LED
> > driver and tlc59108 8 Channel i2c LED driver. This driver is used on
> > the Belkin WRT1900AC access point and the C code is derived from code
> > Belkin contributed to OpenWRT.  However it has been extensively
> > re-written, and a device tree binding added to replace platform data.
> 
> I see this is now in 4.2-rc... And I see you dropped me from Cc in this
> resend series. Because of that, I missed this resend, and couldn't
> object to merging.
> 
> I'm not very happy about this getting merged. I think I had valid
> comments to the driver, to which I did get no answers. You knew my
> objections, but you did not even bother mentioning those in the resend
> intro.

Hi Tomi

Our discussions were going around in circles, no progress being made.
The subsystem maintainer is ultimately the one who needs to decide,
bar Linus himself. Bryan Wu has seen all the discussions, and
ultimately decided the driver was O.K, despite any unresolved issues
you might have.

If you think your PWM code is so much better, please submit a revert
patch plus your PWM LED driver. We can find somebody to do a side by
side review.

Thanks
	Andrew
