From: Maximilian =?ISO-8859-1?Q?G=FCntner?=
	<maximilian.guentner@gmail.com>
Subject: Re: [PATCH] leds: Added driver for the NXP PCA9685 I2C chip
Date: Tue, 15 Oct 2013 01:32:29 +0200
Message-ID: <3053694.67rQ0WDbyA@titan>
References: <2819232.mPNW6mO2uH@titan> <CAK5ve-++aGqSe5dg=MHxNKrk0V75OP0_OY5h2KVYeDY3VjZ4zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:39192 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757144Ab3JNXcc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2013 19:32:32 -0400
In-Reply-To: <CAK5ve-++aGqSe5dg=MHxNKrk0V75OP0_OY5h2KVYeDY3VjZ4zg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel <linux-kernel@vger.kernel.org>, linux-leds <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>

On Monday 14 October 2013 15:08:15 Bryan Wu wrote:
> On Mon, Oct 14, 2013 at 10:31 AM, Maximilian G=FCntner
>=20
> <maximilian.guentner@gmail.com> wrote:
> > The NXP PCA9685 supports 16 channels/leds using a 12-bit PWM (4095
> > levels of brightness)
> > This driver supports configuration using platform_data.
>=20
> I'm OK for this patch basically, just a little picky coding style
> issue as below.
> > +       if (brightness =3D=3D 4096)
> > +               *((u16 *)(i2c_buffer+1)) =3D cpu_to_le16(0x1000);
> > +       else
> > +               *((u16 *)(i2c_buffer+1)) =3D 0x0000;
>=20
> One empty line here probably is better.
fixed.
> > +
> > +       pdata =3D dev_get_platdata(&client->dev);
> > +
>=20
> No need empty line here.
fixed.
> > +       pca9685 =3D devm_kzalloc(&client->dev, 16 * sizeof(*pca9685=
),
> > GFP_KERNEL); +
>=20
> No need empty line here.
fixed.
> > &pca9685[i].led_cdev); +               if (err < 0)
> > +                       goto exit;
> > +       }
>=20
> You can add one empty line here.
fixed

Thanks for the quick review. A v2 of this patch is on its way which add=
resses your and
Peter Meerwald's comments.

Maximilian
--
To unsubscribe from this list: send the line "unsubscribe linux-leds" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
