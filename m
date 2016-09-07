From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch 2/2] leds: add driver for Mellanox systems leds
Date: Wed, 7 Sep 2016 13:39:52 +0000
Message-ID: <AM5PR0501MB20971B387CB332D2EC295C35A2F80@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1473259995-196607-1-git-send-email-vadimp@mellanox.com>
 <821b4b7a-aa0b-293d-01d0-722094c1bc12@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <821b4b7a-aa0b-293d-01d0-722094c1bc12@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

The patch 2/2 I sent after Dave's review.
Now I have patch 1/2 and patch 2/2, produced with git format-patch -2 HEAD =
...
But 1/2 is re-work after your comments.

Would it be OK if I produce now new patch with all fixes as [patch v1], and=
 starting from this point will follow [patch v2], etc?

Sorry for this mess.

Thanks,
Vadim.


> -----Original Message-----
> From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
> Sent: Wednesday, September 07, 2016 4:11 PM
> To: Vadim Pasternak <vadimp@mellanox.com>; rpurdie@rpsys.net
> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; jiri@resnul=
li.us;
> Michael Shych <michaelsh@mellanox.com>
> Subject: Re: [patch 2/2] leds: add driver for Mellanox systems leds
>=20
> Hi Vadim,
>=20
> Please use git format-patch -n, where n is the number of patches to be pr=
oduced
> starting from your current git HEAD.
>=20
> It will produce patches tagged [PATCH 1/2], [PATCH 2/2], or starting from
> [PATCH 0/2] when added --cover-letter switch.
>=20
> Now it looks as if this patch was a part of the patch set comprising two =
patches,
> but I don't see the first one.
> I assume that you added the numbering by hand and this one was intended t=
o be
> put in the one set with the following one:
>=20
> [patch] leds: add driver for Mellanox systems leds
>=20
> On 09/07/2016 04:53 PM, vadimp@mellanox.com wrote:
> > From: Vadim Pasternak <vadimp@mellanox.com>
> >
> > Fix in comments 3KHz and 6KHz to 3Hz and 6Hz respectively.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> >  drivers/leds/leds-mlxcpld.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
> > index 0ec2375..eeed35c 100644
> > --- a/drivers/leds/leds-mlxcpld.c
> > +++ b/drivers/leds/leds-mlxcpld.c
> > @@ -47,8 +47,8 @@
> >  #define MLXPLAT_CPLD_LPC_REG_BASE_ADRR     0x2500 /* LPC bus access */
> >
> >  /* Color codes for leds */
> > -#define LED_OFFSET_HALF		0x01 /* Offset from solid for 3KHz blink
> */
> > -#define LED_OFFSET_FULL		0x02 /* Offset from solid for 6KHz blink
> */
> > +#define LED_OFFSET_HALF		0x01 /* Offset from solid for 3Hz blink
> */
> > +#define LED_OFFSET_FULL		0x02 /* Offset from solid for 6Hz blink
> */
> >  #define LED_IS_OFF		0x00 /* Off */
> >  #define LED_RED_STATIC_ON	0x05 /* Solid red */
> >  #define LED_RED_BLINK_HALF	(LED_RED_STATIC_ON +
> LED_OFFSET_HALF)
> > @@ -237,7 +237,7 @@ static void mlxcpld_led_store_hw(u8 mask, u8 off, u=
8
> vset)
> >  	/* Each led is controlled through low or high nibble of the relevant
> >  	 * CPLD register. Register offset is specified by off parameter.
> >  	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red=
,
> > -	 * 0x6 for 3KHz blink red, 0xd for solid green, 0xe for 3KHz blink
> > +	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
> >  	 * green.
> >  	 * Parameter mask specifies which nibble is used for specific led: ma=
sk
> >  	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
> > @@ -274,8 +274,8 @@ static int mlxcpld_led_blink(struct led_classdev
> > *led,  {
> >  	struct mlxcpld_led_priv *pled =3D cdev_to_priv(led);
> >
> > -	/* HW supports two types of blinking: full (6KHz) and half (3KHz).
> > -	 * For delay on/off zero default setting 3KHz is used.
> > +	/* HW supports two types of blinking: full (6Hz) and half (3Hz).
> > +	 * For delay on/off zero default setting 3Hz is used.
> >  	 */
> >  	if (!(*delay_on =3D=3D 0 && *delay_off =3D=3D 0) &&
> >  	    !(*delay_on =3D=3D LED_BLINK_3HZ && *delay_off =3D=3D LED_BLINK_3=
HZ)
> &&
> >
>=20
>=20
> --
> Best regards,
> Jacek Anaszewski
