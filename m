From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 0/3] Add ktd2692 Flash LED driver
Date: Tue, 3 Mar 2015 00:03:15 +0200
Message-ID: <20150302220315.GU6539@valkosipuli.retiisi.org.uk>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
 <54F02DF5.1000706@samsung.com>
 <54F40DDF.8070708@samsung.com>
 <20150302091530.GQ6539@valkosipuli.retiisi.org.uk>
 <CAK5ve-JYixcO6F470wKZXDN-nkTfaRgmg7FBt1Y5O+tuznruwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK5ve-JYixcO6F470wKZXDN-nkTfaRgmg7FBt1Y5O+tuznruwg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Ingi Kim <ingi2.kim@samsung.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Thierry Reding <treding@nvidia.com>, p.zabel@pengutronix.de, Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, florian.vaussard@epfl.ch, arno@natisbad.org, kuninori.morimoto.gx@renesas.com, hytszk@gmail.com, antonynpavlov@gmail.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, ideal.song@samsung.com
List-Id: linux-leds@vger.kernel.org

Hi Bryan,

On Mon, Mar 02, 2015 at 12:07:42PM -0800, Bryan Wu wrote:
> On Mon, Mar 2, 2015 at 1:15 AM, Sakari Ailus <sakari.ailus@iki.fi> wr=
ote:
> > H Ingi,
> >
> > On Mon, Mar 02, 2015 at 04:14:39PM +0900, Ingi Kim wrote:
> >> Hi Jacek
> >>
> >> On 2015=EB=85=84 02=EC=9B=94 27=EC=9D=BC 17:42, Jacek Anaszewski w=
rote:
> >> > Hi Ingi,
> >> >
> >> > On 02/27/2015 02:01 AM, Ingi Kim wrote:
> >> >> This patch supports KTD2692 flash LED driver
> >> >>
> >> >> Ingi Kim (3):
> >> >>    of: Add vendor prefix for Kinetic technologies
> >> >>    leds: ktd2692: add device tree bindings for ktd2692
> >> >>    leds: Add ktd2692 flash LED driver
> >> >>
> >> >>   .../devicetree/bindings/leds/leds-ktd2692.txt      |   19 ++
> >> >>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
> >> >>   drivers/leds/Kconfig                               |    8 +
> >> >>   drivers/leds/Makefile                              |    1 +
> >> >>   drivers/leds/leds-ktd2692.c                        |  245 +++=
+++++++++++++++++
> >> >>   5 files changed, 274 insertions(+)
> >> >>   create mode 100644 Documentation/devicetree/bindings/leds/led=
s-ktd2692.txt
> >> >>   create mode 100644 drivers/leds/leds-ktd2692.c
> >> >>
> >> >
> >> > In your device tree binding documentation there is torch-gpio me=
ntioned,
> >> > but you seem not to use it in the driver.
> >> >
> >> > We have already LED Flash class (/drivers/leds/led-class-flash.c=
) for
> >> > this type of devices, which handles both torch and flash modes
> >> > (flash_strobe sysfs attribute is provided for strobing the flash=
).
> >> >
> >> > The reference drivers using LED Flash class are still pending [1=
], but I
> >> > think that at least leds-aat1290 driver is almost ready for merg=
ing.
> >> > It controls very similar device to yours.
> >> >
> >> > Another advantage of using LED Flash class is that it has been d=
esigned
> >> > to be compatible with Video for Linux 2 subsystem, which will al=
low for registering LED Flash class devices as a V4L2 sub-devices.
> >> >
> >> > Adding Sakari.
> >> >
> >>
> >> Ok, I'll check LED Flash class, and add torch-gpio
> >
> > Many LED flash chips include a hardware pin for torch control but f=
ew really
> > need it. If you don't, i.e. you can implement the torch using the c=
ontrol bus
> > instead, I think I'd probably drop it from the chip's DT bindings.
> >
>=20
> Ingi, please follow Jacek's advice to use LED Flash class interface.
> I'm reviewing those leds flash drivers and probably merge them soon.
>=20
> Jacek and Sakari thanks for the review.
>=20
> Sakari, so what's the control bus your mentioned here?

I wasn't cc'd in the original patch so I didn't know whether it was I2C=
 or
not. Doesn't appear to be.

--=20
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
