From: Bruce Zhang <bo.zhang@nxp.com>
Subject: RE: [[PATCH]] drivers: leds/trigger: system cannot enter suspend
Date: Tue, 6 Jun 2017 02:47:03 +0000
Message-ID: <AM3PR04MB404B1161E73CF4D2FB3C5058ACB0@AM3PR04MB404.eurprd04.prod.outlook.com>
References: <1496648191-134355-1-git-send-email-bo.zhang@nxp.com>
 <9d1f4e47-0713-043a-4359-db8f856e0b0e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-eopbgr00089.outbound.protection.outlook.com ([40.107.0.89]:40966
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751309AbdFFCrH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 5 Jun 2017 22:47:07 -0400
In-Reply-To: <9d1f4e47-0713-043a-4359-db8f856e0b0e@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "pavel@ucw.cz" <pavel@ucw.cz>, Linux LED Subsystem <linux-leds@vger.kernel.org>

Hi Jacek,

The led_syfs_disable() is used to avoid heartbeat_trig_activate/ heartbeat_=
trig_deactivate called when this led device is suspended.
I am not encounter this issue, but I think it is a risk.

Best Regards,
Bo

-----Original Message-----
From: Jacek Anaszewski [mailto:jacek.anaszewski@gmail.com]=20
Sent: Tuesday, June 06, 2017 3:27 AM
To: Bruce Zhang <bo.zhang@nxp.com>; linux-arm-kernel@lists.infradead.org
Cc: pavel@ucw.cz; Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [[PATCH]] drivers: leds/trigger: system cannot enter suspend

Hi Zhang,

Thanks for the patch. It seems to be almost ready to merge.
Just two issues below.

Please also always cc linux-leds@vger.kernel.org when modifying LED subsyst=
em.

On 06/05/2017 09:36 AM, Zhang Bo wrote:
> System cannot enter suspend mode because of heartbeat led trigger.
> Heartbeat_pm_notifier is called when system prepare to enter suspend=20
> mode, then call led_trigger_unregister to change the trigger of led=20
> device to none. It will send uevent message and the wakeup source count c=
hanged.
>=20
> Add suspend/resume ops to the struct led_trigger, implement these two=20
> ops for ledtrig-heartbeat. Add led_trigger_suspend/led_trigger_resume=20
> funcitons to iterate through all LED class devices registered on given=20
> trigger and call their suspend/resume ops and disable/enable sysfs at the=
 same time.
>=20
> Call led_trigger_suspend{resuem} API in pm_notifier function to=20
> suspend/resume all led devices listed in given trigger.
>=20
> Signed-off-by: Zhang Bo <bo.zhang@nxp.com>
> ---
>  drivers/leds/led-triggers.c              | 34 ++++++++++++++++++++++++++=
+++++
>  drivers/leds/trigger/ledtrig-heartbeat.c | 35 ++++++++++++++++++++++++++=
------
>  include/linux/leds.h                     |  6 ++++++
>  3 files changed, 69 insertions(+), 6 deletions(-)  mode change 100644=20
> =3D> 100755 drivers/leds/led-triggers.c  mode change 100644 =3D> 100755=20
> drivers/leds/trigger/ledtrig-heartbeat.c
>  mode change 100644 =3D> 100755 include/linux/leds.h

You accidentally changed file permissions.

> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c=20
> old mode 100644 new mode 100755 index 431123b..1cb1674
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -333,6 +333,40 @@ void led_trigger_blink_oneshot(struct led_trigger=20
> *trig,  }  EXPORT_SYMBOL_GPL(led_trigger_blink_oneshot);
> =20
> +void led_trigger_suspend(struct led_trigger *trig) {
> +	struct led_classdev *led_cdev;
> +
> +	if (!trig)
> +		return;
> +
> +	read_lock(&trig->leddev_list_lock);
> +	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
> +		if (led_cdev->trigger->suspend)
> +			led_cdev->trigger->suspend(led_cdev);
> +		led_sysfs_disable(led_cdev);

Could you share what kind of problem this call to led_syfs_disable() solves=
? Did you come across one?

> +	}
> +	read_unlock(&trig->leddev_list_lock);
> +}
> +EXPORT_SYMBOL_GPL(led_trigger_suspend);
> +
> +void led_trigger_resume(struct led_trigger *trig) {
> +	struct led_classdev *led_cdev;
> +
> +	if (!trig)
> +		return;
> +
> +	read_lock(&trig->leddev_list_lock);
> +	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
> +		if (led_cdev->trigger->resume)
> +			led_cdev->trigger->resume(led_cdev);
> +		led_sysfs_enable(led_cdev);
> +	}
> +	read_unlock(&trig->leddev_list_lock);
> +}
> +EXPORT_SYMBOL_GPL(led_trigger_resume);
> +
>  void led_trigger_register_simple(const char *name, struct led_trigger=20
> **tp)  {
>  	struct led_trigger *trig;
> diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c=20
> b/drivers/leds/trigger/ledtrig-heartbeat.c
> old mode 100644
> new mode 100755
> index afa3b40..8f779dd
> --- a/drivers/leds/trigger/ledtrig-heartbeat.c
> +++ b/drivers/leds/trigger/ledtrig-heartbeat.c
> @@ -142,6 +142,7 @@ static void heartbeat_trig_activate(struct led_classd=
ev *led_cdev)
>  	led_heartbeat_function(heartbeat_data->timer.data);
>  	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
>  	led_cdev->activated =3D true;
> +	led_cdev->suspended =3D false;
>  }
> =20
>  static void heartbeat_trig_deactivate(struct led_classdev *led_cdev)=20
> @@ -154,6 +155,30 @@ static void heartbeat_trig_deactivate(struct led_cla=
ssdev *led_cdev)
>  		kfree(heartbeat_data);
>  		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
>  		led_cdev->activated =3D false;
> +		led_cdev->suspended =3D false;
> +	}
> +}
> +
> +static void heartbeat_trig_resume(struct led_classdev *led_cdev) {
> +	struct heartbeat_trig_data *heartbeat_data =3D led_cdev->trigger_data;
> +
> +	if (led_cdev->suspended) {
> +		setup_timer(&heartbeat_data->timer,
> +			    led_heartbeat_function, (unsigned long) led_cdev);
> +		heartbeat_data->phase =3D 0;
> +		led_heartbeat_function(heartbeat_data->timer.data);
> +		led_cdev->suspended =3D false;
> +	}
> +}
> +
> +static void heartbeat_trig_suspend(struct led_classdev *led_cdev) {
> +	struct heartbeat_trig_data *heartbeat_data =3D led_cdev->trigger_data;
> +
> +	if (led_cdev->activated && !led_cdev->suspended) {
> +		del_timer_sync(&heartbeat_data->timer);
> +		led_cdev->suspended =3D true;
>  	}
>  }
> =20
> @@ -161,25 +186,23 @@ static void heartbeat_trig_deactivate(struct led_cl=
assdev *led_cdev)
>  	.name     =3D "heartbeat",
>  	.activate =3D heartbeat_trig_activate,
>  	.deactivate =3D heartbeat_trig_deactivate,
> +	.suspend =3D heartbeat_trig_suspend,
> +	.resume =3D heartbeat_trig_resume,
>  };
> =20
>  static int heartbeat_pm_notifier(struct notifier_block *nb,
>  				 unsigned long pm_event, void *unused)  {
> -	int rc;
> -
>  	switch (pm_event) {
>  	case PM_SUSPEND_PREPARE:
>  	case PM_HIBERNATION_PREPARE:
>  	case PM_RESTORE_PREPARE:
> -		led_trigger_unregister(&heartbeat_led_trigger);
> +		led_trigger_suspend(&heartbeat_led_trigger);
>  		break;
>  	case PM_POST_SUSPEND:
>  	case PM_POST_HIBERNATION:
>  	case PM_POST_RESTORE:
> -		rc =3D led_trigger_register(&heartbeat_led_trigger);
> -		if (rc)
> -			pr_err("could not re-register heartbeat trigger\n");
> +		led_trigger_resume(&heartbeat_led_trigger);
>  		break;
>  	default:
>  		break;
> diff --git a/include/linux/leds.h b/include/linux/leds.h old mode=20
> 100644 new mode 100755 index 64c56d4..b792950
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -111,6 +111,7 @@ struct led_classdev {
>  	void			*trigger_data;
>  	/* true if activated - deactivate routine uses it to do cleanup */
>  	bool			activated;
> +	bool			suspended;
>  #endif
> =20
>  #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED @@ -254,6 +255,8 @@ struct=20
> led_trigger {
>  	const char	 *name;
>  	void		(*activate)(struct led_classdev *led_cdev);
>  	void		(*deactivate)(struct led_classdev *led_cdev);
> +	void		(*suspend)(struct led_classdev *led_cdev);
> +	void		(*resume)(struct led_classdev *led_cdev);
> =20
>  	/* LEDs under control by this trigger (for simple triggers) */
>  	rwlock_t	  leddev_list_lock;
> @@ -291,6 +294,9 @@ extern void led_trigger_set(struct led_classdev *led_=
cdev,
>  			struct led_trigger *trigger);
>  extern void led_trigger_remove(struct led_classdev *led_cdev);
> =20
> +extern void led_trigger_suspend(struct led_trigger *trig); extern=20
> +void led_trigger_resume(struct led_trigger *trig);
> +
>  static inline void *led_get_trigger_data(struct led_classdev=20
> *led_cdev)  {
>  	return led_cdev->trigger_data;
>=20
