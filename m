Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C11A55D866;
	Thu, 10 Sep 2026 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064572; cv=pass; b=elOFnxt7VTd2YUGMSfrUy2GcCZ1AfW7veARZXE9kmLAuoLqUdjNJDRskFvXtBcfdxtwbkEzJ3idlpZDytK81nCZOE74pMvZAHH3sFhfHoQa4+vRp2B0wKMxN3fVYY5oyOXW+aYSNyz3znGQKMKhkIq0s76YO1T5GNKbDZ9rCv+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064572; c=relaxed/simple;
	bh=s6TAq6tZAe5Iy03lsRkZhtIpcRXvlBCzOMuGnnn79FA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MGpMH3ylMz4xjwfla8c31CKvVcNxA4PMJegL0FnSz9y6R8ux1MgPDBXrBoQhrU4td/9zRblVnI322FZQ5Jlvn95I2WoTJxEbo/u8AZZHO+utFpeUhng89tx/UysNMrM8Tot89u7xXX/+SOBDAPUybaIAXLdO7nGm3sod1gieOHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=HTLdGj4n; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="HTLdGj4n"
ARC-Seal: i=1; a=rsa-sha256; t=1789064543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cit1RrELEv2NaJW3wBmLWanSVLvJDjkzUcEvYBykxBLjsiDTasa0TAplepU4y5/jdw/WF2zA6J490Sg00Y9gxU4+GNDrUVefjvnLXNK5o5xXjy0q4Bi7/QnUQH2P9aeo9MifJinN93SXicUYYR+cVwLho7jxEOr6gYkdTjviylM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789064543; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZmCjMTaiDn5377nlajvOBsqnIM1xWRVBKt/5Bd0oh9Y=; 
	b=fR/ho3s6U77QJI6ZPF/UsoiqYOBWDlFJVPhry6ztFrzdNnSlDY1/GxEa/oNxLVWV3r4/bQ6uZT3rBq4/t5JPRRbtXtusyfzJm/j9AVc7+uZRO0mDvTQ/KrU8C9dlN5MP69W3EB6btiCxflAtxz8S+mty6wK19h8hBPzHOk4syhA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789064543;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=ZmCjMTaiDn5377nlajvOBsqnIM1xWRVBKt/5Bd0oh9Y=;
	b=HTLdGj4ntSk86nZDBgeeOkItjVPaUrlfQZjUqcacnW9b/CULP41zp1Fdbop0CoSp
	oAMJfqn5VMdB/hkDy2YyNH8cwDrm+crr843NWl/ptfAEv0Q7g0gOCPxpF7N/yywKJRt
	wUoEUyfn3UPKRPsQS2oPQjZZJGOW4OgFoK3Ao4X1zcrDZptXeH3DgDbipehlZ3X7rDs
	xahLao0GsF0/PMAlehZT03IIz/Y8ybfwKV6NL7WqPABftn0sAKnVjiBSNCrUJogv7ob
	702zW7+I5jbzl7d7XjEZSeMTYa8mO6cBuI8bWVjUqAYlXmJ7uc/Sb0ffuzSbz0hek0u
	565agKMRjA==
Received: by mx.zohomail.com with SMTPS id 1789064542542466.8267106033461;
	Thu, 10 Sep 2026 11:22:22 -0700 (PDT)
Message-ID: <6745f76a53b1b36ea4354dbd6a4900793ee8108a.camel@rong.moe>
Subject: Re: [PATCH v6 09/12] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
 <linux@weissschuh.net>,  Benson Leung <bleung@chromium.org>, Guenter Roeck
 <groeck@chromium.org>, Marek =?ISO-8859-1?Q?Beh=FAn?=	 <kabel@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ike Panhc
 <ikepanhc@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar
 <vsankar@lenovo.com>, 	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <20260910154506.GH1051768@google.com>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
	 <20260902-leds-trigger-hw-changed-v6-9-55693cd78877@rong.moe>
	 <20260910154506.GH1051768@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 02:17:15 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Lee,

Thanks for your review.

On Thu, 2026-09-10 at 16:45 +0100, Lee Jones wrote:
> On Wed, 02 Sep 2026, Rong Zhang wrote:
>=20
> > Some hardware can autonomously activate/deactivate hardware control.
> > After that, the LED hardware notifies the LED driver. Currently, there
> > is no mechanism for LED drivers to notify the LED core about such event=
s
> > and initiate a trigger transition to reflect the hardware state.
> >=20
> > Add a new interface called led_trigger_notify_hw_control_changed(), so
> > that LED drivers can call it to notify the LED core about the
> > transition.
> >=20
> > The interface only allows two transitions:
> >=20
> > 1. "none" =3D> private trigger
> > 2. private trigger =3D> "none"
> >=20
> > If the current trigger is neither the private trigger nor "none", no
> > transition will be made. This protects the currently selected software
> > trigger.
> >=20
> > Note that LED_OFF won't be emitted during the #2 transition, as some
> > hardware may have selected a new brightness level during its hardware
> > state transition (e.g., laptop keyboards with a shortcut cycling throug=
h
> > different backlight brightnesses and auto mode).
> >=20
> > The interface is designed as a void function as any failure should be
> > non-fatal and the result of transition should not have any impact on th=
e
> > LED drivers' event handling procedures.
> >=20
> > To use the interface, the config LEDS_TRIGGERS_HW_CHANGED must be
> > enabled, and the LED driver must set the LED_TRIG_HW_CHANGED flag for
> > the classdev.
> >=20
> > By default, the config is enabled when LEDS_BRIGHTNESS_HW_CHANGED is
> > enabled.
> >=20
> > Acked-by: Ike Panhc <ikepanhc@gmail.com>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v6:
> > - Implement workqueue deferal mechanism
> >   - https://msgid.link/e2b081dfd8f96511a73b86ab3ec75e5cd759b79b.camel@r=
ong.moe
> >=20
> > Changes in v5:
> > - Address a concern from Sashiko:
> >   - led_trigger_notify_hw_control_changed() might sleep, but without an=
y
> >     internal deferral mechanism or annotation
> >   - Annotate the method with might_sleep(), since the very first users
> >     of the interface, i.e., ideapad-laptop and (supposedly)
> >     thinkpad_acpi, will call the interface from work contexts. It does
> >     not deserve the overhead of internal deferral mechanism
> >   - https://sashiko.dev/#/patchset/20260802-leds-trigger-hw-changed-v4-=
0-f97e2ca976fe@rong.moe?part=3D9
> >=20
> > Changes in v4:
> > - Enable LEDS_TRIGGERS_HW_CHANGED by default when
> >   LEDS_BRIGHTNESS_HW_CHANGED is enabled
> >=20
> > Changes in v3:
> > - Adopt guard() (Thanks Thomas Wei=C3=9Fschuh)
> > - Reword documentations
> > ---
> >  Documentation/leds/leds-class.rst |  52 ++++++++++++++++++
> >  drivers/leds/led-class.c          |   6 +++
> >  drivers/leds/led-triggers.c       | 108 ++++++++++++++++++++++++++++++=
+++++++-
> >  drivers/leds/leds.h               |   8 +++
> >  drivers/leds/trigger/Kconfig      |  10 ++++
> >  include/linux/leds.h              |  13 +++++
> >  6 files changed, 195 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/led=
s-class.rst
> > index 2d41a6db602c..adbc57b9f49c 100644
> > --- a/Documentation/leds/leds-class.rst
> > +++ b/Documentation/leds/leds-class.rst
> > @@ -334,6 +334,58 @@ not necessary for them to coordinate via `hw_contr=
ol_*` callbacks.
> >  When the LED is in hw control, no software blink is possible and doing=
 so
> >  will effectively disable hw control.
> > =20
> > +Hardware-initiated trigger transition
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Some hardware can autonomously activate/deactivate hardware control. A=
fter that,
> > +the LED hardware notifies the LED driver.
> > +
> > +If the driver can detect such transitions and thus wants to notify the=
 LED core
> > +to update the current trigger then the `LED_TRIG_HW_CHANGED` flag must=
 be set in
> > +flags before registering. To update the current trigger accordingly, c=
all
> > +`led_trigger_notify_hw_control_changed` on the LED classdev.
> > +
> > +This capability is restricted to the LED device's private trigger. The=
 private
> > +trigger must have been properly registered (see above) and named after
> > +`hw_control_trigger`.
> > +
> > +Only two transitions are defined:
> > +
> > +- "none" =3D> private trigger:
> > +        This happens when the hardware autonomously activates hardware=
 control
> > +        and when "none" (i.e., no trigger) is currently active. If the=
 private
> > +        trigger is already active when the method is called, this is e=
ssentially
> > +        a no-op.
> > +
> > +        The activation sequence for the private trigger will be execut=
ed as
> > +        normal.
> > +
> > +        The LED driver and its private trigger must be able to handle =
the
> > +        activation sequence even if the hardware is currently in hardw=
are
> > +        control.
> > +
> > +        If error occurs in the activation sequence, the LED Trigger co=
re reverts
> > +        the effective trigger to "none".
> > +
> > +- private trigger =3D> "none"
> > +        This happens when the hardware autonomously deactivates hardwa=
re control
> > +        and when the private trigger is currently active. If "none" (i=
.e., no
> > +        trigger) is active when the method is called, this is essentia=
lly a
> > +        no-op.
> > +
> > +        The deactivation sequence for the private trigger will be exec=
uted as
> > +        normal, except that the current LED brightness is retained. Th=
e reason
> > +        for keeping the brightness unchanged is that some hardware may=
 choose a
> > +        specific brightness instead of simply turning off the LED afte=
r
> > +        autonomously deactivating hardware control.
> > +
> > +        The LED driver and its private trigger must be able to handle =
the
> > +        deactivation sequence even if the hardware is not currently in=
 hardware
> > +        control.
> > +
> > +If the current trigger is neither the private trigger nor "none", no t=
ransition
> > +will be made.
> > +
> >  Known Issues
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 7e571bd1de5b..3b438d8da5e0 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -611,6 +611,9 @@ int led_classdev_register_ext(struct device *parent=
,
> >  	led_trigger_set_default(led_cdev);
> >  #endif
> > =20
> > +	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
> > +		led_trigger_init_hw_changed(led_cdev);
> > +
> >  	mutex_unlock(&led_cdev->led_access);
> > =20
> >  	dev_dbg(parent, "Registered led device: %s\n",
> > @@ -631,6 +634,9 @@ void led_classdev_unregister(struct led_classdev *l=
ed_cdev)
> >  	if (IS_ERR_OR_NULL(led_cdev->dev))
> >  		return;
> > =20
> > +	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
> > +		led_trigger_destroy_hw_changed(led_cdev);
> > +
> >  #ifdef CONFIG_LEDS_TRIGGERS
> >  	down_write(&led_cdev->trigger_lock);
> >  	if (led_cdev->trigger)
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index cb49a02a8b3c..a9d992a88616 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> > @@ -7,7 +7,9 @@
> >   * Author: Richard Purdie <rpurdie@openedhand.com>
> >   */
> > =20
> > +#include <linux/bug.h>
> >  #include <linux/cleanup.h>
> > +#include <linux/compiler.h>
> >  #include <linux/export.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> > @@ -193,7 +195,8 @@ ssize_t led_trigger_read(struct file *filp, struct =
kobject *kobj,
> >  EXPORT_SYMBOL_GPL(led_trigger_read);
> > =20
> >  /* Caller must ensure led_cdev->trigger_lock held */
> > -int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger =
*trig)
> > +static int __led_trigger_set(struct led_classdev *led_cdev, struct led=
_trigger *trig,
> > +			     bool hw_triggered)
> >  {
> >  	char *event =3D NULL;
> >  	char *envp[2];
> > @@ -224,7 +227,21>  		led_cdev->trigger_data =3D NULL;
> >  		led_cdev->activated =3D false;
> >  		led_cdev->flags &=3D ~LED_INIT_DEFAULT_TRIGGER;
> > -		led_set_brightness(led_cdev, LED_OFF);
> > +
> > +		/*
> > +		 * Hardware may have selected a new brightness level during its
> > +		 * hardware control transition, so only reset brightness if we
> > +		 * are switching to another trigger or if the switching is not
> > +		 * hardware triggered.
> > +		 *
> > +		 * Note that this does not apply to the error path, as running
> > +		 * into the error path implies a none =3D> private trigger
> > +		 * transition. This hints that the LED driver and its private
> > +		 * trigger must have some fundamental bugs, so don't bother
>=20
> "don't bother" sounds abrasive.  Please reword.

ACK.

>=20
> > +		 * leaving the LED in an undefined state.
> > +		 */
> > +		if (trig || !hw_triggered)
> > +			led_set_brightness(led_cdev, LED_OFF);
> >  	}
> >  	if (trig) {
> >  		spin_lock(&trig->leddev_list_lock);
> > @@ -288,6 +305,11 @@ int led_trigger_set(struct led_classdev *led_cdev,=
 struct led_trigger *trig)
> > =20
> >  	return ret;
> >  }
> > +
> > +int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger =
*trig)
> > +{
> > +	return __led_trigger_set(led_cdev, trig, false);
> > +}
> >  EXPORT_SYMBOL_GPL(led_trigger_set);
> > =20
> >  void led_trigger_remove(struct led_classdev *led_cdev)
> > @@ -468,6 +490,88 @@ int devm_led_trigger_register(struct device *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(devm_led_trigger_register);
> > =20
> > +#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
> > +
> > +static void led_trigger_do_hw_control_transition(struct led_classdev *=
led_cdev, bool activate,
> > +						 struct led_trigger *hc_trig)
> > +{
> > +	int err =3D 0;
>=20
> 'ret' is used in this file.

ACK.

>=20
> > +
> > +	if (!led_cdev->trigger) {
> > +		/* "none" =3D> private trigger. */
> > +		if (activate)
> > +			err =3D __led_trigger_set(led_cdev, hc_trig, true);
> > +	} else if (led_cdev->trigger =3D=3D hc_trig) {
> > +		/* private trigger =3D> "none". */
> > +		if (!activate)
> > +			err =3D __led_trigger_set(led_cdev, NULL, true);
> > +	} else {
> > +		/* Other trigger is active. */
> > +		dev_dbg(led_cdev->dev,
> > +			"Ignoring hw control transition (%s %s) while %s is active",
> > +			activate ? "activate" : "deactivate", hc_trig->name,
> > +			led_cdev->trigger->name);
> > +
> > +		return;
> > +	}
> > +
> > +	if (err)
> > +		dev_warn(led_cdev->dev, "Failed to %s %s in hw control transition: %=
d",
> > +			 activate ? "activate" : "deactivate", hc_trig->name, err);
>=20
> How helpful are these debug messages now development is complete, really?

ACK. I will remove them.

>=20
> > +}
> > +
> > +static void led_trigger_hw_control_changed_worker(struct work_struct *=
work)
> > +{
> > +	struct led_classdev *led_cdev =3D
> > +		container_of(work, struct led_classdev, triggers_hw_changed_work);
> > +	bool activate =3D READ_ONCE(led_cdev->triggers_hw_changed);
> > +
> > +	scoped_guard(rwsem_read, &triggers_list_lock) {
> > +		struct led_trigger *trig;
> > +
> > +		list_for_each_entry(trig, &trigger_list, next_trig) {
> > +			if (trig->trigger_type =3D=3D led_cdev->trigger_type &&
> > +			    !strcmp(trig->name, led_cdev->hw_control_trigger)) {
> > +				guard(rwsem_write)(&led_cdev->trigger_lock);
> > +
> > +				led_trigger_do_hw_control_transition(led_cdev, activate, trig);
> > +				return;
> > +			}
> > +		}
> > +	}
> > +
> > +	dev_err(led_cdev->dev,
> > +		"%s() is called, but the private trigger (%s) is not properly regist=
ered\n",
> > +		__func__, led_cdev->hw_control_trigger);
>=20
> Please make all user-facing messages user-friendly.
>=20
> No internal function names please.
>=20
> Also, since this is effectively an issue, it should be dev_warn().

ACK to all three points.

>=20
> > +}
> > +
> > +void led_trigger_notify_hw_control_changed(struct led_classdev *led_cd=
ev, bool activate)
> > +{
> > +	/* Restricted to private triggers. */
> > +	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
> > +		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
> > +		return;
> > +
> > +	WRITE_ONCE(led_cdev->triggers_hw_changed, activate);
> > +
> > +	schedule_work(&led_cdev->triggers_hw_changed_work);
> > +}
> > +EXPORT_SYMBOL_GPL(led_trigger_notify_hw_control_changed);
> > +
> > +void led_trigger_init_hw_changed(struct led_classdev *led_cdev)
> > +{
> > +	INIT_WORK(&led_cdev->triggers_hw_changed_work, led_trigger_hw_control=
_changed_worker);
> > +}
> > +EXPORT_SYMBOL_GPL(led_trigger_init_hw_changed);
>=20
> Where is this exported to?

led_classdev_register_ext() in led-class.c, see the beginning of the
patch.

>=20
> > +
> > +void led_trigger_destroy_hw_changed(struct led_classdev *led_cdev)
> > +{
> > +	disable_work_sync(&led_cdev->triggers_hw_changed_work);
> > +}
> > +EXPORT_SYMBOL_GPL(led_trigger_destroy_hw_changed);
>=20
> This to?

led_classdev_unregister() in led-class.c, ditto.

Should these two exports be eliminated,
led_trigger_hw_control_changed_worker() must be exported, and multiple
#ifdefs must be added to led-class.c.=C2=A0That way is also OK for me. I ju=
st
personally prefer leaving #ifdefs in the header file as much as possible.
May I kindly ask about your preferences regarding the coding style for
conditional compilation?

Thanks,
Rong=20

>=20
> > +
> > +#endif /* CONFIG_LEDS_TRIGGERS_HW_CHANGED */
> > +
> >  /* Simple LED Trigger Interface */
> > =20
> >  void led_trigger_event(struct led_trigger *trig,
> > diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> > index b08a289397e4..bdac2336012e 100644
> > --- a/drivers/leds/leds.h
> > +++ b/drivers/leds/leds.h
> > @@ -33,4 +33,12 @@ ssize_t trigger_may_offload_show(struct device *dev,
> >  extern struct rw_semaphore leds_list_lock;
> >  extern struct list_head leds_list;
> > =20
> > +#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
> > +void led_trigger_init_hw_changed(struct led_classdev *led_cdev);
> > +void led_trigger_destroy_hw_changed(struct led_classdev *led_cdev);
> > +#else /* !CONFIG_LEDS_TRIGGERS_HW_CHANGED */
> > +static inline void led_trigger_init_hw_changed(struct led_classdev *le=
d_cdev) { }
> > +static inline void led_trigger_destroy_hw_changed(struct led_classdev =
*led_cdev) { }
> > +#endif /* CONFIG_LEDS_TRIGGERS_HW_CHANGED */
> > +
> >  #endif	/* __LEDS_H_INCLUDED */
> > diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfi=
g
> > index c11282a74b5a..a11d04ce4ab2 100644
> > --- a/drivers/leds/trigger/Kconfig
> > +++ b/drivers/leds/trigger/Kconfig
> > @@ -9,6 +9,16 @@ menuconfig LEDS_TRIGGERS
> > =20
> >  if LEDS_TRIGGERS
> > =20
> > +config LEDS_TRIGGERS_HW_CHANGED
> > +	bool "LED hardware-initiated trigger transition support"
> > +	default LEDS_BRIGHTNESS_HW_CHANGED
> > +	help
> > +	  This option enables support for hardware initiated hardware control
> > +	  transitions, where the LED hardware autonomously switches between
> > +	  "none" (i.e., no trigger) and its private trigger.
> > +
> > +	  See Documentation/leds/leds-class.rst for details.
> > +
> >  config LEDS_TRIGGER_TIMER
> >  	tristate "LED Timer Trigger"
> >  	help
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index bee2b4309a09..93b3fd7e5636 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -109,6 +109,7 @@ struct led_classdev {
> >  #define LED_INIT_DEFAULT_TRIGGER BIT(23)
> >  #define LED_REJECT_NAME_CONFLICT BIT(24)
> >  #define LED_MULTI_COLOR		BIT(25)
> > +#define LED_TRIG_HW_CHANGED	BIT(26)
> > =20
> >  	/* set_brightness_work / blink_timer flags, atomic, private. */
> >  	unsigned long		work_flags;
> > @@ -239,6 +240,11 @@ struct led_classdev {
> >  	struct kernfs_node	*brightness_hw_changed_kn;
> >  #endif
> > =20
> > +#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
> > +	bool			triggers_hw_changed;
> > +	struct work_struct	triggers_hw_changed_work;
> > +#endif
> > +
> >  	/* Ensures consistent access to the LED class device */
> >  	struct mutex		led_access;
> >  };
> > @@ -609,6 +615,13 @@ led_trigger_get_brightness(const struct led_trigge=
r *trigger)
> > =20
> >  #endif /* CONFIG_LEDS_TRIGGERS */
> > =20
> > +#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
> > +void led_trigger_notify_hw_control_changed(struct led_classdev *led_cd=
ev, bool activate);
> > +#else
> > +static inline void led_trigger_notify_hw_control_changed(struct led_cl=
assdev *led_cdev,
> > +							 bool activate) {}
> > +#endif
> > +
> >  /* Trigger specific enum */
> >  enum led_trigger_netdev_modes {
> >  	TRIGGER_NETDEV_LINK =3D 0,
> >=20
> > --=20
> > 2.55.0
> >=20
