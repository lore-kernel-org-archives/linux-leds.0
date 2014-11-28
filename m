From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH/RFC v8 08/14] DT: Add documentation for exynos4-is
 'flashes' property
Date: Fri, 28 Nov 2014 14:38:23 +0000
Message-ID: <20141128143823.GJ25883@leverpostej>
References: <1417166286-27685-1-git-send-email-j.anaszewski@samsung.com>
 <1417166286-27685-9-git-send-email-j.anaszewski@samsung.com>
 <20141128111404.GB25883@leverpostej>
 <547865EA.5010700@samsung.com>
 <20141128123003.GE25883@leverpostej>
 <54788278.7080101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54788278.7080101-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "pavel-+ZI9xUNit7I@public.gmane.org" <pavel-+ZI9xUNit7I@public.gmane.org>, "cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "sakari.ailus-X3B1VOXEql0@public.gmane.org" <sakari.ailus-X3B1VOXEql0@public.gmane.org>, "s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Nov 28, 2014 at 02:11:04PM +0000, Jacek Anaszewski wrote:
> On 11/28/2014 01:30 PM, Mark Rutland wrote:
> > On Fri, Nov 28, 2014 at 12:09:14PM +0000, Jacek Anaszewski wrote:
> >> On 11/28/2014 12:14 PM, Mark Rutland wrote:
> >>> On Fri, Nov 28, 2014 at 09:18:00AM +0000, Jacek Anaszewski wrote:
> >>>> This patch adds a description of 'flashes' property
> >>>> to the samsung-fimc.txt.
> >>>>
> >>>> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>>> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>>> Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> >>>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >>>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> >>>> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >>>> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> >>>> ---
> >>>>    .../devicetree/bindings/media/samsung-fimc.txt     |    7 +++=
++++
> >>>>    1 file changed, 7 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/samsung-fim=
c.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
> >>>> index 922d6f8..4b7ed03 100644
> >>>> --- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
> >>>> +++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
> >>>> @@ -40,6 +40,12 @@ should be inactive. For the "active-a" state =
the camera port A must be activated
> >>>>    and the port B deactivated and for the state "active-b" it sh=
ould be the other
> >>>>    way around.
> >>>>
> >>>> +Optional properties:
> >>>> +
> >>>> +- flashes - array of strings with flash led names; the name has=
 to
> >>>> +	    be same with the related led label
> >>>> +	    (see Documentation/devicetree/bindings/leds/common.txt)
> >>>> +
> >>>
> >>> Why is this not an array of phandles to the LED nodes? That's muc=
h
> >>> better than strings.
> >>
> >> This is because a single flash led device can control many sub-led=
s,
> >> which are represented by child nodes in the Device Tree.
> >> Every sub-led is registered as a separate LED Flash class device
> >> in the LED subsystem, but in fact they share the same struct devic=
e
> >> and thus have access only to the parent's phandle.
> >
> > But that's a Linux infrastrcture issue, no? You don't have to use t=
he
> > node from the struct device to find the relevant phandle.
>=20
> Right.
>=20
> >> The LED Flash
> >> class devices are wrapped by V4L2 sub-devices and register
> >> asynchronously within a media device. Since the v4l2_subdev struct=
ure
> >> has a 'name' field, it is convenient to initialize it with
> >> parsed 'label' property of a child led node and match the
> >> sub-devices in the media device basing on it.
> >
> > While that might be convenient, I don't think it's fantastic to use=
 that
> > to describe the relationship, as this leaks Linux internals (e.g. I=
 can
> > refer to a name that doesn't exist in the DT but happens to be what
> > Linux used, and it would work). Also, are the labels guaranteed to =
be
> > globally unique?
>=20
> The labels are used for initializing class device name and kernel
> doesn't allow to initialize two devices with same names.
> This implies that labels are guaranteed to be globally unique.

On Linux, yes, but that's an implementation detail, not a property of
the binding=C2=B7

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
