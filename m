From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] Add ktd2692 Flash LED driver
Date: Mon, 2 Mar 2015 12:07:42 -0800
Message-ID: <CAK5ve-JYixcO6F470wKZXDN-nkTfaRgmg7FBt1Y5O+tuznruwg@mail.gmail.com>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
 <54F02DF5.1000706@samsung.com> <54F40DDF.8070708@samsung.com> <20150302091530.GQ6539@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150302091530.GQ6539-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, florian.vaussard-p8DiymsW2f8@public.gmane.org, arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, hytszk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Mon, Mar 2, 2015 at 1:15 AM, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org> wrot=
e:
> H Ingi,
>
> On Mon, Mar 02, 2015 at 04:14:39PM +0900, Ingi Kim wrote:
>> Hi Jacek
>>
>> On 2015=EB=85=84 02=EC=9B=94 27=EC=9D=BC 17:42, Jacek Anaszewski wro=
te:
>> > Hi Ingi,
>> >
>> > On 02/27/2015 02:01 AM, Ingi Kim wrote:
>> >> This patch supports KTD2692 flash LED driver
>> >>
>> >> Ingi Kim (3):
>> >>    of: Add vendor prefix for Kinetic technologies
>> >>    leds: ktd2692: add device tree bindings for ktd2692
>> >>    leds: Add ktd2692 flash LED driver
>> >>
>> >>   .../devicetree/bindings/leds/leds-ktd2692.txt      |   19 ++
>> >>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>> >>   drivers/leds/Kconfig                               |    8 +
>> >>   drivers/leds/Makefile                              |    1 +
>> >>   drivers/leds/leds-ktd2692.c                        |  245 +++++=
+++++++++++++++
>> >>   5 files changed, 274 insertions(+)
>> >>   create mode 100644 Documentation/devicetree/bindings/leds/leds-=
ktd2692.txt
>> >>   create mode 100644 drivers/leds/leds-ktd2692.c
>> >>
>> >
>> > In your device tree binding documentation there is torch-gpio ment=
ioned,
>> > but you seem not to use it in the driver.
>> >
>> > We have already LED Flash class (/drivers/leds/led-class-flash.c) =
for
>> > this type of devices, which handles both torch and flash modes
>> > (flash_strobe sysfs attribute is provided for strobing the flash).
>> >
>> > The reference drivers using LED Flash class are still pending [1],=
 but I
>> > think that at least leds-aat1290 driver is almost ready for mergin=
g.
>> > It controls very similar device to yours.
>> >
>> > Another advantage of using LED Flash class is that it has been des=
igned
>> > to be compatible with Video for Linux 2 subsystem, which will allo=
w for registering LED Flash class devices as a V4L2 sub-devices.
>> >
>> > Adding Sakari.
>> >
>>
>> Ok, I'll check LED Flash class, and add torch-gpio
>
> Many LED flash chips include a hardware pin for torch control but few=
 really
> need it. If you don't, i.e. you can implement the torch using the con=
trol bus
> instead, I think I'd probably drop it from the chip's DT bindings.
>

Ingi, please follow Jacek's advice to use LED Flash class interface.
I'm reviewing those leds flash drivers and probably merge them soon.

Jacek and Sakari thanks for the review.

Sakari, so what's the control bus your mentioned here?

Thanks,
-Bryan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
