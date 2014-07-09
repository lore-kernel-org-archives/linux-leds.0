From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
Subject: Re: [PATCH 1/1] leds: blinkm: Remove unused variable
Date: Wed, 09 Jul 2014 14:34:34 +0200
Message-ID: <3676295.nUINk5lfjs@aragorn>
References: <1404216443-21177-1-git-send-email-sachin.kamat@samsung.com> <CAK5ve-KYwnDuB0YooOo7zsZ_EH8VuJ_9ex_919CDEtJqiNrp=g@mail.gmail.com> <3261853.AEHXRXfVcs@samweis.auenland.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart6116426.k1Ey6s7Vhy"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:60617 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755576AbaGIMei (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 9 Jul 2014 08:34:38 -0400
In-Reply-To: <3261853.AEHXRXfVcs@samweis.auenland.lan>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, spk.linux@gmail.com

This is a multi-part message in MIME format.

--nextPart6116426.k1Ey6s7Vhy
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

What about this ...


--=20

Dipl.-Ing.
Jan-Simon M=F6ller

jansimon.moeller@gmx.de
Am Dienstag, 1. Juli 2014, 23:50:29 schrieb Jan-Simon M=F6ller:
> Nighttime here. I'll look tomorrow.
>=20
> > On Tue, Jul 1, 2014 at 5:07 AM, Sachin Kamat <sachin.kamat@samsung.=
com>
>=20
> wrote:
> > > 'ret' is not used in the function. Remove it.
> >=20
> > Removing it is easy but I guess we should check the return error st=
atus
> > here. Jan-Simon, what's your opinion then?
> >=20
> > Thanks,
> > -Bryan
> >=20
> > > Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> > > ---
> > >=20
> > >  drivers/leds/leds-blinkm.c |    8 +++-----
> > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blink=
m.c
> > > index d0452b099aee..f07f920ac0ac 100644
> > > --- a/drivers/leds/leds-blinkm.c
> > > +++ b/drivers/leds/leds-blinkm.c
> > > @@ -441,14 +441,13 @@ static int blinkm_transfer_hw(struct i2c_cl=
ient
> > > *client, int cmd)>
> > >=20
> > >  static void led_work(struct work_struct *work)
> > >  {
> > >=20
> > > -       int ret;
> > >=20
> > >         struct blinkm_led *led;
> > >         struct blinkm_data *data;
> > >         struct blinkm_work *blm_work =3D work_to_blmwork(work);
> > >        =20
> > >         led =3D blm_work->blinkm_led;
> > >         data =3D i2c_get_clientdata(led->i2c_client);
> > >=20
> > > -       ret =3D blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
> > > +       blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
> > >=20
> > >         atomic_dec(&led->active);
> > >         dev_dbg(&led->i2c_client->dev,
> > >        =20
> > >                         "# DONE # next_red =3D %d, next_green =3D=
 %d,"
> > >=20
> > > @@ -546,9 +545,8 @@ static void blinkm_led_blue_set(struct led_cl=
assdev
> > > *led_cdev,>
> > >=20
> > >  static void blinkm_init_hw(struct i2c_client *client)
> > >  {
> > >=20
> > > -       int ret;
> > > -       ret =3D blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
> > > -       ret =3D blinkm_transfer_hw(client, BLM_GO_RGB);
> > > +       blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
> > > +       blinkm_transfer_hw(client, BLM_GO_RGB);
> > >=20
> > >  }
> > > =20
> > >  static int blinkm_test_run(struct i2c_client *client)
> > >=20
> > > --
> > > 1.7.9.5

--nextPart6116426.k1Ey6s7Vhy
Content-Disposition: attachment; filename="0001-Enhance-error-checking-and-remove-sequence-handling.patch"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; charset="UTF-8"; name="0001-Enhance-error-checking-and-remove-sequence-handling.patch"

>From 652251115033be83c3626b260d9f1fdf0e479b73 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Jan-Simon=3D20M=3DC3=3DB6ller?=3D <dl9pf@gmx.de>
Date: Wed, 9 Jul 2014 14:26:53 +0200
Subject: [PATCH] Enhance error-checking and remove sequence handling.
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
---
 drivers/leds/leds-blinkm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index d0452b0..9e7b988 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -449,6 +449,8 @@ static void led_work(struct work_struct *work)
 =09led =3D blm_work->blinkm_led;
 =09data =3D i2c_get_clientdata(led->i2c_client);
 =09ret =3D blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
+        if(ret)
+            dev_err(&led->i2c_client->dev, "BlinkM: HW transfer error\=
n");
 =09atomic_dec(&led->active);
 =09dev_dbg(&led->i2c_client->dev,
 =09=09=09"# DONE # next_red =3D %d, next_green =3D %d,"
@@ -548,7 +550,11 @@ static void blinkm_init_hw(struct i2c_client *clie=
nt)
 {
 =09int ret;
 =09ret =3D blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
+        if(ret)
+            dev_err(&client->dev, "BlinkM: HW transfer error\n");
 =09ret =3D blinkm_transfer_hw(client, BLM_GO_RGB);
+        if(ret)
+            dev_err(&client->dev, "BlinkM: HW transfer error\n");
 }
=20
 static int blinkm_test_run(struct i2c_client *client)
@@ -747,6 +753,8 @@ static int blinkm_remove(struct i2c_client *client)=

=20
 =09/* make sure no workqueue entries are pending */
 =09for (i =3D 0; i < 3; i++) {
+=09=09//imbalance active counter to prevent further work
+=09=09atomic_inc(&data->blinkm_leds[i].active);
 =09=09flush_scheduled_work();
 =09=09led_classdev_unregister(&data->blinkm_leds[i].led_cdev);
 =09}
@@ -780,6 +788,10 @@ static int blinkm_remove(struct i2c_client *client=
)
 =09=09dev_err(&client->dev, "Failure in blinkm_remove ignored. Continu=
ing.\n");
=20
 =09sysfs_remove_group(&client->dev.kobj, &blinkm_group);
+
+        // make sure all is done before returning
+=09flush_scheduled_work();
+
 =09return 0;
 }
=20
--=20
1.8.4.5


--nextPart6116426.k1Ey6s7Vhy--
