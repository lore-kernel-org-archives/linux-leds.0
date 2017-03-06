From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2] leds: cpcap: new driver
Date: Mon, 6 Mar 2017 15:38:59 -0800
Message-ID: <20170306233859.GQ20572@atomide.com>
References: <20170305172234.24120-1-sre@kernel.org>
 <20170306221147.GA24272@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170306221147.GA24272@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

* Pavel Machek <pavel@ucw.cz> [170306 14:13]:
> > Motorola CPCAP is a PMIC found in multiple smartphones.
> > This driver adds support for the chip's LED controllers.
> > It has explicit support for all controllers used by the
> > Droid 4. Since no datasheets are available the other
> > available controllers are not supported until somebody
> > verified, that the register layout matches.
> 
> This of course leads me to two questions:
> 
> 1) Where can I get Droid 4?

There's plenty of them available used for a few tens of $/€
on ebay as it was a popular phone on Verizon network in the
US. It works fine on 3G networks outside the U.S, 4G probably
only works in the US.

> 2) How well is it supported?

Basic things like UART, MMC, eMMC, WLAN, I2C, SPI, HDMI,
clocks, PMIC and regulators work with lots of other dts
configured devices heading into tomorrow's Linux next in my
dts branch omap-for-v4.12/dt-droid4. LCD related patches have
been posted but are not yet in next.

Things that currently don't work are ADC, USB, charging,
audio and modems. The modems are on OHCI/EHCI, audio is on the
PMIC similar to the twl4030. I'm slowly working on a driver for
ADC/USB/charging with few more issues to sort out. I do have
ADC/USB/charging working with my current hacks though.

I've posted some notes at:

http://muru.com/linux/d4/

And Sebastian has information in his blog including a device
status matrix at:

http://elektranox.org/droid4/

Cheers,

Tony
