From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv6 0/2] Driver for TI tlc591xx 8/16 Channel i2c LED driver
Date: Mon, 9 Feb 2015 15:13:43 +0100
Message-ID: <20150209141343.GA5631@lunn.ch>
References: <1422367161-16487-1-git-send-email-andrew@lunn.ch>
 <20150206031048.GA9614@lunn.ch>
 <54D89F0D.9050506@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54D89F0D.9050506-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, vigneshr-l0cyMroinI0@public.gmane.org, Matthew.Fatheree-REUqjI8E1xrQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Mon, Feb 09, 2015 at 01:50:37PM +0200, Tomi Valkeinen wrote:
> On 06/02/15 05:10, Andrew Lunn wrote:
> > On Tue, Jan 27, 2015 at 02:59:19PM +0100, Andrew Lunn wrote:
> >> This patchset is a driver for the TI tlc59116 16 Channel i2c LED
> >> driver and tlc59108 8 Channel i2c LED driver. This driver is used on
> >> the Belkin WRT1900AC access point and the C code is derived from code
> >> Belkin contributed to OpenWRT.  However it has been extensively
> >> re-written, and a device tree binding added to replace platform data.
> > 
> > Hi Bryan
> > 
> > Do you have any further comments on this driver? Are you likely to
> > queue it up for the next merge window?
> 
> Hi Andrew,
> 
> You didn't comment anything on my and Peter's questions on v5 thread
> about this being a PWM driver.

Hi Tomi

I don't comment, because it is not our decision to make any more. We
have been around this argument many times, so we are not going to
resolve it. The LED and PWM maintainers need to decide, not us.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
