From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 3/3] as3645a: Use integer numbers for parsing LEDs
Date: Fri, 8 Sep 2017 16:45:08 +0300
Message-ID: <20170908134507.7tniq6rfrpbvb45z@valkosipuli.retiisi.org.uk>
References: <20170908124213.18904-1-sakari.ailus@linux.intel.com>
 <20170908124213.18904-4-sakari.ailus@linux.intel.com>
 <20170908131758.GQ18365@amd>
 <20170908132333.rlhurlwrzq43ss2k@valkosipuli.retiisi.org.uk>
 <20170908133841.GS18365@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170908133841.GS18365@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Fri, Sep 08, 2017 at 03:38:41PM +0200, Pavel Machek wrote:
> On Fri 2017-09-08 16:23:34, Sakari Ailus wrote:
> > Hi Pavel,
> > 
> > Thanks for the review.
> > 
> > On Fri, Sep 08, 2017 at 03:17:58PM +0200, Pavel Machek wrote:
> > > On Fri 2017-09-08 15:42:13, Sakari Ailus wrote:
> > > > Use integer numbers for LEDs, 0 is the flash and 1 is the indicator.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > > 
> > > Dunno. Old code is shorter, old device tree is shorter, ... IMO both
> > > versions are fine, because the LEDs are really different. Do we have
> > > documentation somewhere saying that reg= should be used for this? Are
> > > you doing this for consistency?
> > 
> > Well, actually for ACPI support. :-) It requires less driver changes this
> > way. See 17th and 18th patches in "[PATCH v9 00/23] Unified fwnode endpoint
> > parser, async sub-device notifier support, N9 flash DTS".
> 
> ACPI, I hate ACPI.

:-D

> 
> > A number of chips have LED binding that is aligned, see e.g.
> > Documentation/devicetree/bindings/leds/leds-bcm6328.txt .
> 
> Ok, yes, that's common way LED controllers are handled. Usually all
> the LEDs are "same", but...

I presume that's the case with most LED driver chips: all the outputs are
alike.

> 
> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>

Thanks!

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
