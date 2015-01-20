From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH/RFC v10 09/19] DT: Add documentation for the mfd Maxim
 max77693
Date: Tue, 20 Jan 2015 15:38:15 +0000
Message-ID: <20150120153815.GB13701@x1>
References: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
 <1420816989-1808-10-git-send-email-j.anaszewski@samsung.com>
 <20150120112107.GG13701@x1>
 <54BE67EA.2070507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54BE67EA.2070507-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Tue, 20 Jan 2015, Jacek Anaszewski wrote:

> On 01/20/2015 12:21 PM, Lee Jones wrote:
> >On Fri, 09 Jan 2015, Jacek Anaszewski wrote:
> >
> >>This patch adds device tree binding documentation for
> >>the flash cell of the Maxim max77693 multifunctional device.
> >>
> >>Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> >>Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> >>Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >>Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> >>Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >>---
> >>  Documentation/devicetree/bindings/mfd/max77693.txt |   69 +++++++=
+++++++++++++
> >>  1 file changed, 69 insertions(+)
> >>
> >>diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/D=
ocumentation/devicetree/bindings/mfd/max77693.txt
> >>index 01e9f30..ef184f0 100644
> >>--- a/Documentation/devicetree/bindings/mfd/max77693.txt
> >>+++ b/Documentation/devicetree/bindings/mfd/max77693.txt
> >>@@ -41,7 +41,52 @@ Optional properties:
> >>  	 To get more informations, please refer to documentaion.
> >>  	[*] refer Documentation/devicetree/bindings/pwm/pwm.txt
> >>
> >>+- led : the LED submodule device node
> >>+
> >>+There are two led outputs available - fled1 and fled2. Each of the=
m can
> >>+control a separate led or they can be connected together to double
> >>+the maximum current for a single connected led. One led is represe=
nted
> >>+by one child node.
> >>+
> >>+Required properties:
> >>+- compatible : Must be "maxim,max77693-led".
> >>+
> >>+Optional properties:
> >>+- maxim,trigger-type : Flash trigger type.
> >>+	Possible trigger types:
> >>+		MAX77693_LED_TRIG_TYPE_EDGE - Rising edge of the signal triggers
> >>+			the flash,
> >>+		MAX77693_LED_TRIG_TYPE_LEVEL - Strobe pulse length controls
> >>+			duration of the flash.
> >
> >I think you should represent the proper values here instead of the
> >defines.
>=20
> I see both versions in the existing bindings and also a combination o=
f
> them, e.g.: MAX77693_LED_TRIG_TYPE_EDGE (0). I think that it is
> reasonable to mention the macros, especially if they are to appear
> in the DT binding example at the end of the documentation file.
>=20
> >>+- maxim,boost-mode :
> >>+	In boost mode the device can produce up to 1.2A of total current
> >>+	on both outputs. The maximum current on each output is reduced
> >>+	to 625mA then. If not enabled explicitly, boost setting defaults =
to
> >>+	MAX77693_LED_BOOST_FIXED in case both current sources are used.
> >>+	Possible values:
> >>+		MAX77693_LED_BOOST_OFF - no boost,
> >>+		MAX77693_LED_BOOST_ADAPTIVE - adaptive mode,
> >>+		MAX77693_LED_BOOST_FIXED - fixed mode.
> >
> >Same here.
>=20
> MAX77693_LED_BOOST_OFF (0) - no boost,
> MAX77693_LED_BOOST_ADAPTIVE (1) - adaptive mode,
> MAX77693_LED_BOOST_FIXED (2) - fixed mode.

This is fine too.

> >>+- maxim,boost-vout : Output voltage of the boost module in millivo=
lts.
> >
> >-mvout?
> >-microvout?
>=20
> maxim,boost-mvout ?

Right.

> >>+- maxim,vsys-min : Low input voltage level in millivolts. Flash is=
 not fired
> >>+	if chip estimates that system voltage could drop below this level=
 due
> >>+	to flash power consumption.
> >
> >mvsys?
> >microvsys?
>=20
> maxim,mvsys-min ?

Looks okay to me.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
