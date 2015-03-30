From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v2 04/11] DT: Add documentation for the mfd Maxim max77693
Date: Mon, 30 Mar 2015 12:35:05 +0300
Message-ID: <20150330093504.GC18321@valkosipuli.retiisi.org.uk>
References: <5518FD05.5060800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5518FD05.5060800-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On Mon, Mar 30, 2015 at 09:36:37AM +0200, Jacek Anaszewski wrote:
> Hi Sakari,
> 
> On 03/28/2015 11:55 PM, Sakari Ailus wrote:
> >On Fri, Mar 27, 2015 at 02:49:38PM +0100, Jacek Anaszewski wrote:
> >>This patch adds device tree binding documentation for
> >>the flash cell of the Maxim max77693 multifunctional device.
> >>
> >>Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> >>Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> >>---
> >>  Documentation/devicetree/bindings/mfd/max77693.txt |   61 ++++++++++++++++++++
> >>  1 file changed, 61 insertions(+)
> >>
> >>diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.txt
> >>index 38e6440..15c546ea 100644
> >>--- a/Documentation/devicetree/bindings/mfd/max77693.txt
> >>+++ b/Documentation/devicetree/bindings/mfd/max77693.txt
> >>@@ -76,7 +76,53 @@ Optional properties:
> >>      Valid values: 4300000, 4700000, 4800000, 4900000
> >>      Default: 4300000
> >>
> >>+- led : the LED submodule device node
> >>+
> >>+There are two LED outputs available - FLED1 and FLED2. Each of them can
> >>+control a separate LED or they can be connected together to double
> >>+the maximum current for a single connected LED. One LED is represented
> >>+by one child node.
> >>+
> >>+Required properties:
> >>+- compatible : Must be "maxim,max77693-led".
> >>+
> >>+Optional properties:
> >>+- maxim,trigger-type : Flash trigger type.
> >>+	Possible trigger types:
> >>+		LEDS_TRIG_TYPE_EDGE (0) - Rising edge of the signal triggers
> >>+			the flash,
> >>+		LEDS_TRIG_TYPE_LEVEL (1) - Strobe pulse length controls duration
> >>+			of the flash.
> >>+- maxim,boost-mode :
> >>+	In boost mode the device can produce up to 1.2A of total current
> >>+	on both outputs. The maximum current on each output is reduced
> >>+	to 625mA then. If not enabled explicitly, boost setting defaults to
> >>+	LEDS_BOOST_FIXED in case both current sources are used.
> >>+	Possible values:
> >>+		LEDS_BOOST_OFF (0) - no boost,
> >>+		LEDS_BOOST_ADAPTIVE (1) - adaptive mode,
> >>+		LEDS_BOOST_FIXED (2) - fixed mode.
> >>+- maxim,boost-mvout : Output voltage of the boost module in millivolts.
> >
> >What are the possible values for this?
> 
> maxim,boost-mvout : Output voltage of the boost module in millivolts
> 	Range: 3300 - 5500

Could you please add that?

> 
> Do you think it is necessary to mention also allowed step for all the
> values?

That's a good question. They probably are more or less visible in the driver
code. I think I'd document them here, but I'm fine with not adding them as
well. You probably wouldn't be able to meaningfully use the chip without the
datasheet anyway.

> >Is the datasheet publicly available btw.?
> 
> I have an access only to the non-public one.

I googled a bit, couldn't find anything relevant immediately at least.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
