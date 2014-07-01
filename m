From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
Subject: Re: [PATCH 1/1] leds: blinkm: Remove unused variable
Date: Tue, 01 Jul 2014 23:50:29 +0200
Message-ID: <3261853.AEHXRXfVcs@samweis.auenland.lan>
References: <1404216443-21177-1-git-send-email-sachin.kamat@samsung.com> <CAK5ve-KYwnDuB0YooOo7zsZ_EH8VuJ_9ex_919CDEtJqiNrp=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:53545 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965094AbaGAWDW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Jul 2014 18:03:22 -0400
In-Reply-To: <CAK5ve-KYwnDuB0YooOo7zsZ_EH8VuJ_9ex_919CDEtJqiNrp=g@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, spk.linux@gmail.com

Nighttime here. I'll look tomorrow.
--=20

Dipl.-Ing.
Jan-Simon M=F6ller

jansimon.moeller@gmx.de
Am Dienstag, 1. Juli 2014, 08:54:27 schrieb Bryan Wu:
> On Tue, Jul 1, 2014 at 5:07 AM, Sachin Kamat <sachin.kamat@samsung.co=
m>=20
wrote:
> > 'ret' is not used in the function. Remove it.
>=20
> Removing it is easy but I guess we should check the return error stat=
us
> here. Jan-Simon, what's your opinion then?
>=20
> Thanks,
> -Bryan
>=20
> > Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> > ---
> >=20
> >  drivers/leds/leds-blinkm.c |    8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.=
c
> > index d0452b099aee..f07f920ac0ac 100644
> > --- a/drivers/leds/leds-blinkm.c
> > +++ b/drivers/leds/leds-blinkm.c
> > @@ -441,14 +441,13 @@ static int blinkm_transfer_hw(struct i2c_clie=
nt
> > *client, int cmd)>=20
> >  static void led_work(struct work_struct *work)
> >  {
> >=20
> > -       int ret;
> >=20
> >         struct blinkm_led *led;
> >         struct blinkm_data *data;
> >         struct blinkm_work *blm_work =3D work_to_blmwork(work);
> >        =20
> >         led =3D blm_work->blinkm_led;
> >         data =3D i2c_get_clientdata(led->i2c_client);
> >=20
> > -       ret =3D blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
> > +       blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
> >=20
> >         atomic_dec(&led->active);
> >         dev_dbg(&led->i2c_client->dev,
> >        =20
> >                         "# DONE # next_red =3D %d, next_green =3D %=
d,"
> >=20
> > @@ -546,9 +545,8 @@ static void blinkm_led_blue_set(struct led_clas=
sdev
> > *led_cdev,>=20
> >  static void blinkm_init_hw(struct i2c_client *client)
> >  {
> >=20
> > -       int ret;
> > -       ret =3D blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
> > -       ret =3D blinkm_transfer_hw(client, BLM_GO_RGB);
> > +       blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
> > +       blinkm_transfer_hw(client, BLM_GO_RGB);
> >=20
> >  }
> > =20
> >  static int blinkm_test_run(struct i2c_client *client)
> >=20
> > --
> > 1.7.9.5
