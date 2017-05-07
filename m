From: Pete Zhang <pete.zhang@nxp.com>
Subject: RE: [PATCH] leds/trigger: system can't enter suspend.
Date: Sun, 7 May 2017 10:55:13 +0000
Message-ID: <VI1PR0401MB182329ABCA96B6EBF79A2E0683E90@VI1PR0401MB1823.eurprd04.prod.outlook.com>
References: <1494122481-15228-1-git-send-email-sanshan.zhang@nxp.com>
 <20170507083013.GA11515@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170507083013.GA11515@xo-6d-61-c0.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>
List-Id: linux-leds@vger.kernel.org

Please see my comments inline.

-----Original Message-----
From: Pavel Machek [mailto:pavel@ucw.cz]=20
Sent: Sunday, May 07, 2017 4:30 PM
To: Pete Zhang
Cc: linux-kernel@vger.kernel.org; linux-leds@vger.kernel.org; j.anaszewski@=
samsung.com; rpurdie@rpsys.net
Subject: Re: [PATCH] leds/trigger: system can't enter suspend.

On Sun 2017-05-07 10:01:21, sanshan zhang wrote:
> From: zhang sanshan <sanshan.zhang@nxp.com>
>=20
> system can't enter suspend when enable led heartbeat.
>=20
> pm will call heartbeat_pm_notifier when suspend.
> system will prepare led states, and led_trigger_unregister will use=20
> led_trigger_set to set trigger.
> kobject_uevent_env will send event,it will call ep_poll_callback to=20
> hold a wakeup source if we enable wakelock in kernel.
> So that system can't enter suspend.
>=20
> If we set led device tigger to NONE, there is not need to send=20
> notification to user space.

Does this bug also happen on mainline kernels?

[Sanshan]: We found this bug in kernel 4.9, But I think it also can reprodu=
ce in mainline
=20
Are you sure noone relies on the "none" trigger behaviour? We usually don't=
 change user interface without good reason.

[Sanshan]:  From android's perspective, we do not use 'none' trigger. If we=
 set the trigger to 'none', the sys node have been deregistered,=20
            There is no mean to notify userland to change the permission of=
 sys node.=20

Actually.. is someone using those notifications at all? Telling userland th=
at userland changed LED trigger is somehow... interesting.
[sanshan] : Yes, maybe the effect of this patch is userland can't know curr=
ent trigger is 'none'

[Sanshan]: I don't know whether we can just turn off the LED rather than re=
gistering the led trigger when suspend.=20

=20

							=09

>=20
> Change-Id: I9f7ee5764d7e31b9a225dae5517cb36137675f9d
> Signed-off-by: zhang sanshan <sanshan.zhang@nxp.com>
> Signed-off-by: Zhang Bo <bo.zhang@nxp.com>
> ---
>  drivers/leds/led-triggers.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c=20
> index 431123b..f03c2bd1 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -108,13 +108,10 @@ void led_trigger_set(struct led_classdev *led_cdev,=
 struct led_trigger *trig)
>  	unsigned long flags;
>  	char *event =3D NULL;
>  	char *envp[2];
> -	const char *name;
> =20
>  	if (!led_cdev->trigger && !trig)
>  		return;
> =20
> -	name =3D trig ? trig->name : "none";
> -	event =3D kasprintf(GFP_KERNEL, "TRIGGER=3D%s", name);
> =20
>  	/* Remove any existing trigger */
>  	if (led_cdev->trigger) {
> @@ -138,6 +135,10 @@ void led_trigger_set(struct led_classdev *led_cdev, =
struct led_trigger *trig)
>  			trig->activate(led_cdev);
>  	}
> =20
> +	if (NULL !=3D trig)
> +		event =3D kasprintf(GFP_KERNEL, "TRIGGER=3D%s", trig->name);
> +	else
> +		return;
>  	if (event) {
>  		envp[0] =3D event;
>  		envp[1] =3D NULL;
> --
> 1.9.1

--
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html
