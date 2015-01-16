From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCHv3 0/2] Driver for TI tlc59116 16 Channel i2c LED driver
Date: Fri, 16 Jan 2015 20:17:34 +0100
Message-ID: <20150116191734.GB31577@lunn.ch>
References: <1421277308-3477-1-git-send-email-andrew@lunn.ch>
 <54B9259C.3070403@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:56717 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757145AbbAPTTf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 16 Jan 2015 14:19:35 -0500
Content-Disposition: inline
In-Reply-To: <54B9259C.3070403@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, "R, Vignesh" <vigneshr@ti.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, kaloz@openwrt.org, Matthew.Fatheree@belkin.com, Sekhar Nori <nsekhar@ti.com>

On Fri, Jan 16, 2015 at 04:52:12PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 15/01/15 01:15, Andrew Lunn wrote:
> > This patchset is a driver for the TI tlc59116 16 Channel i2c LED
> > driver. This driver is used on the Belkin WRT1900AC access point and
> > the C code is derived from code Belkin contributed to OpenWRT.
> > However it has been extensively re-written, and a device tree binding
> > added to replace platform data.
> 
> We have a TLC59108 on one of our boards, and with a quick glance it
> looks about the same as TLC59116, except the amount of outputs.

Hi Tomi

I took a look at the TLC59108. The hardware designs have not made it
easy, but it does look similar enough that my driver can be extended
to cover both. These extensions It will not change the DT binding, it
will just gain a new compatibility string. So i would prefer my driver
is first fully reviewed and accepted, and then i will take a stab at
extending it for the TLC59108. I will need help testing it, but i hope
you can help there.

    Andrew
