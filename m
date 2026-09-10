Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065CD3655FC;
	Thu, 10 Sep 2026 18:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063640; cv=pass; b=KsT4LD/ezPM8A2C8YJfgRUza9oTZKp2gqo1y7cepJbgJ8Fgw9cmJw8rxEuQPho/+asVzf3A2AnXXEfHgAvRruWumgT2gmbEtLYCEVYnVQ0EUEZgfDcctU763EAXQbvfgFYzNwKMbRDRa2PCszpCqgW6QQGCIxZh9tXlJpVAUd2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063640; c=relaxed/simple;
	bh=ZZ9k9BJPDjyec6NUEKK5xZV+5aftBFmoP6dqleK93NA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pEd0tC/79gy9UTvlF8W2p5L9zE+9tsJSWbAJ7Xl0gNrlC6acnz6b0dmK0sx2Lf0m59xRcjmZF6fVUstCevQ4Q/XmQKlRaXI4v8efbLnfchpmb75Y3lKghBfMFQwppUe2Hh8upf9bvtWZWZZADEJCFeatw8OU0DKQ5DZ80fQXWC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=cYGoeRQi; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="cYGoeRQi"
ARC-Seal: i=1; a=rsa-sha256; t=1789063612; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dTq9HnrijxZVGb1l75Lla0qH6Bqe/9AMX6xReITqc5sDkBx0WQDro5KtgO/GHB8x81Cj545e2EGrvlww+sh0e5zov87TJvYHHDKiREqgZUbfupr936LkQjLJwo3L4a4VXSB0sSKzT+a6mGliLS9zeIMwdT9hjX4J3ZuvEIoRJXo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789063612; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2SfrWRVMTCicD0vrJdm191v2eUq49w3e51Pb9Wn9R+s=; 
	b=f6NQfwxKjRHJgA1IcA6j2zmhYL3pApoRvbQT9bB74i4u0mrVaoPVs6LNCFh4655iwY9y3gDs6Y3POVozfJu4+b9QzLl0V7b5v3Lbs5w1ghGDxCMQn9L74sqXD3w50CK0MxB9UKOTM6sV7gHrxnQM1KUj8JuSnXEOd7aHT8U9d7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789063612;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=2SfrWRVMTCicD0vrJdm191v2eUq49w3e51Pb9Wn9R+s=;
	b=cYGoeRQiXZuS63LAJT9evzWh7kc94SDr5dsRLNofhzzgTTXKymjN6+6rRmj84U/g
	Dsc+6YgIr4EI9LCs+zMKnoI970M12AJIA2k97loW97EItvYFgDZm6Wh9tBDH0aJ7nqE
	hASjpfji5sgUNGcWtqbGFuzzJVGHzDtwoXeya6VKVAAWuxWkoe19OTgp+frIWPzjBDc
	9ET0lG7BApz60gRC+Gqkuk6akISmspn68jy1LZms3p042P4/5qgYUplJ5W/dRqxgw0n
	v92hdIu1qGYr/Zyq6+DjFTKjOH+HvuyhtDjgnanOcI8KLyL+eYRcYkmoTYy2NGSZbu9
	VWaXBKEZPw==
Received: by mx.zohomail.com with SMTPS id 1789063609615346.12294702549775;
	Thu, 10 Sep 2026 11:06:49 -0700 (PDT)
Message-ID: <cdecf33094742331552a4b86d43673cdf1590bf2.camel@rong.moe>
Subject: Re: [PATCH v6 04/12] leds: trigger: Add offloaded() callback and
 provide trigger_may_offload attribute
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
In-Reply-To: <20260910150535.GG1051768@google.com>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
	 <20260902-leds-trigger-hw-changed-v6-4-55693cd78877@rong.moe>
	 <20260910150535.GG1051768@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 02:01:41 +0800
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

On Thu, 2026-09-10 at 16:05 +0100, Lee Jones wrote:
> On Wed, 02 Sep 2026, Rong Zhang wrote:
>=20
> > There are multiple triggers implementing hardware control. However, the
> > LED trigger core doesn't really know the hardware control (offloaded)
> > state since the coordination is done directly between the trigger and
> > the LED driver. It can only assume private triggers as offloaded and
> > generic ones as not offloaded.
> >=20
> > Add an offloaded() callback so that triggers can report their offloaded
> > states to the LED trigger core. When unimplemented, it defaults to true
> > for private triggers and false for generic ones to keep the current
> > behavior unchanged.
> >=20
> > With that, provide a new attribute "trigger_may_offload", so that
> > userspace can determine:
> >=20
> > - if the LED device supports hardware control (supported =3D> visible)
> > - which trigger is the hardware control trigger selected by the LED
> >   device
> > - if the trigger is selected ("<foo_trigger>")
> > - if the trigger is offloaded ("[foo_trigger]")
> >=20
> > Note: the documentation describes the attribute as "returning a list"
> > despite the LED core currently only supports one hardware control
> > trigger per LED device. This is intentional to make the attribute
> > extensible in the future without breaking userspace.
> >=20
> > Acked-by: Ike Panhc <ikepanhc@gmail.com>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v6:
> > - Update Date: and KernelVersion: for the document of
> >   /sys/class/leds/<led>/trigger_may_offload
> >=20
> > Changes in v3:
> > - Rearrange the series so that the code using the offloaded() callback =
is
> >   introduced before the driver implementation (thanks Thomas Wei=C3=9Fs=
chuh)
> > - Reword documentation (ditto)
> > - Adopt guard() and lockdep (ditto)
> > - Adopt __led_trigger_is_hw_controlled() from newly-integrated PATCH 1
> > ---
> >  Documentation/ABI/testing/sysfs-class-led | 22 ++++++++++++++++++++++
> >  Documentation/leds/leds-class.rst         | 20 ++++++++++++++++++++
> >  drivers/leds/led-class.c                  | 22 ++++++++++++++++++++++
> >  drivers/leds/led-triggers.c               | 30 +++++++++++++++++++++++=
+++++++
> >  drivers/leds/leds.h                       |  2 ++
> >  include/linux/leds.h                      |  1 +
> >  6 files changed, 97 insertions(+)
> >=20
> > diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/=
ABI/testing/sysfs-class-led
> > index d4c918cc11a1..e3605fc55fa8 100644
> > --- a/Documentation/ABI/testing/sysfs-class-led
> > +++ b/Documentation/ABI/testing/sysfs-class-led
> > @@ -78,6 +78,28 @@ Description:
> >  		(which would often be configured in the device tree for the
> >  		hardware).
> > =20
> > +What:		/sys/class/leds/<led>/trigger_may_offload
>=20
> *_to_hw?

ACK.

>=20
> > +Date:		September 2026
> > +KernelVersion:	7.4
> > +Contact:	linux-leds@vger.kernel.org
> > +Description:
> > +		Names and states of triggers that may be offloaded to hardware.
> > +		Such triggers are also called "hardware control trigger" in some
> > +		context.
> > +
> > +		Only exists when the LED supports trigger offload.
> > +
> > +		Reading this file returns a list of triggers that are capable to
> > +		be offloaded. The optional brackets around the trigger name
> > +		indicate the state of the current trigger:
> > +
> > +		- `foo_trigger`: the trigger is not selected.
> > +		- `<foo_trigger>`: the trigger is selected, but falls back to
> > +		  software blink for some reason (e.g., incompatible trigger
> > +		  parameters)
> > +		- `[foo_trigger]`: the trigger is selected and offloaded to
> > +		  hardware.
> > +
> >  What:		/sys/class/leds/<led>/inverted
> >  Date:		January 2011
> >  KernelVersion:	2.6.38
> > diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/led=
s-class.rst
> > index 3913966cfdac..2d41a6db602c 100644
> > --- a/Documentation/leds/leds-class.rst
> > +++ b/Documentation/leds/leds-class.rst
> > @@ -242,6 +242,9 @@ ops and needs to declare specific support for the s=
upported triggers.
> > =20
> >  With hw control we refer to the LED driven by hardware.
> > =20
> > +A sysfs attribute `trigger_may_offload` is provided for userspace to
> > +query supported triggers and their states.
> > +
> >  LED driver must define the following value to support hw control:
> > =20
> >      - hw_control_trigger:
> > @@ -298,6 +301,15 @@ LED driver must implement the following API to sup=
port hw control:
> >                  Returns a pointer to a struct device or NULL if nothin=
g
> >                  is currently attached.
> > =20
> > +LED trigger should implement the following API to indicate hw control:
> > +    - offloaded:
>=20
> hw_offloaded?

ACK.

>=20
> > +                return a boolean indicating if the trigger is currentl=
y
> > +                offloaded to hardware.
> > +
> > +                If a trigger doesn't implement this callback, the defa=
ult
> > +                value will be true for private triggers and false for =
generic
> > +                ones.
> > +
> >  LED driver can activate additional modes by default to workaround the
> >  impossibility of supporting each different mode on the supported trigg=
er.
> >  Examples are hardcoding the blink speed to a set interval, enable spec=
ial
> > @@ -311,6 +323,14 @@ the end use hw_control_set to activate hw control.
> >  A trigger can use hw_control_get to check if a LED is already in hw co=
ntrol
> >  and init their flags.
> > =20
> > +Alternatively, a private trigger can be implemented along with the LED=
 driver if
> > +the LED's hardware control doesn't fit any generic trigger. To associa=
te the
> > +private trigger with the LED classdev, their `trigger_type` must be th=
e same. To
> > +declare that the private trigger provides hardware control for the ass=
ociated
> > +LED classdev, set the `hw_control_trigger` string to the trigger's nam=
e. Since
> > +both the LED classdev and the private trigger are in the same LED driv=
er, it's
> > +not necessary for them to coordinate via `hw_control_*` callbacks.
> > +
> >  When the LED is in hw control, no software blink is possible and doing=
 so
> >  will effectively disable hw control.
> > =20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 39cc2f3ea63f..7e571bd1de5b 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -96,8 +96,30 @@ static const struct bin_attribute *const led_trigger=
_bin_attrs[] =3D {
> >  	&bin_attr_trigger,
> >  	NULL,
> >  };
> > +
> > +static DEVICE_ATTR_RO(trigger_may_offload);
> > +static struct attribute *led_trigger_attrs[] =3D {
> > +	&dev_attr_trigger_may_offload.attr,
> > +	NULL
> > +};
> > +
> > +static umode_t led_trigger_is_visible(struct kobject *kobj,
>=20
> Why doesn't all of this live in the triggers file as well?

The current revision only exports trigger_may_offload() to coordinate the
two files (led-class.c and led-trigger.c).

If we had to move led_trigger_is_visible() into led-triggers.c, the
trigger_may_offload and led_trigger_attrs must be moved as well. Due to
the movement, we would have to export led_trigger_attrs and
led_trigger_is_visible() to fill led_trigger_group.

in short, moving led_trigger_is_visible() requires exporting more
symbols.

To make things tidier, how about moving led_trigger_group and
led_trigger_bin_attrs into led-triggers.c as well? In this manner we only
need to export led_trigger_group, and the #ifdef block here is
eliminated. What do you think?

>=20
> > +				      struct attribute *attr,
> > +				      int idx)
> > +{
> > +	struct device *dev =3D kobj_to_dev(kobj);
> > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > +
> > +	if (attr =3D=3D &dev_attr_trigger_may_offload.attr)
> > +		return led_cdev->hw_control_trigger ? attr->mode : 0;
> > +
> > +	return attr->mode;
> > +}
> > +
> >  static const struct attribute_group led_trigger_group =3D {
> >  	.bin_attrs =3D led_trigger_bin_attrs,
> > +	.attrs =3D led_trigger_attrs,
> > +	.is_visible =3D led_trigger_is_visible,
> >  };
> >  #endif
> > =20
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index 804a04b326c4..de17a8bbb4d4 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> > @@ -42,6 +42,10 @@ static bool __led_trigger_is_hw_controlled(struct le=
d_classdev *led_cdev)
> >  	if (!led_cdev->trigger)
> >  		return false;
> > =20
> > +	if (led_cdev->trigger->offloaded)
> > +		return led_cdev->trigger->offloaded(led_cdev);
> > +
> > +	/* Otherwise assume private triggers as always offloaded. */
>=20
> s/as/are/

ACK.

>=20
> >  	return led_cdev->trigger->trigger_type;
> >  }
> > =20
> > @@ -341,6 +345,32 @@ void led_trigger_set_default(struct led_classdev *=
led_cdev)
> >  }
> >  EXPORT_SYMBOL_GPL(led_trigger_set_default);
> > =20
> > +ssize_t trigger_may_offload_show(struct device *dev,
> > +				 struct device_attribute *attr, char *buf)
> > +{
> > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > +	struct led_trigger *trig;
> > +	bool hit, offloaded;
> > +	int len;
> > +
> > +	guard(mutex)(&led_cdev->led_access);
> > +	guard(rwsem_read)(&led_cdev->trigger_lock);
> > +
> > +	trig =3D led_cdev->trigger;
> > +
> > +	offloaded =3D __led_trigger_is_hw_controlled(led_cdev);
> > +	hit =3D offloaded || (trig && !strcmp(led_cdev->hw_control_trigger, t=
rig->name));
> > +
> > +	/* [offloaded] <active_but_not_offloaded> inactive */
>=20
> Why do they have to live in different 'containers'?

The comment might be somewhat misleading...

An LED device can never have an offloaded trigger and an active-but-not-
offloaded trigger at the same time. The comment just demonstrates how the
output might look like.

The output is multiplexed to help userspace determine two things in one
read:

- The name of the LED device's hardware control trigger
- The state of the said trigger

That being said, if the complexity is undesired, it's OK to convert the
attribute into a dumb one that only returns the plain name of the
hardware control trigger. In this manner we will need to provide an
additional attribute to expose the offloaded state. This can be achieved
by adopting the attribute "offloaded" from netdev into led-triggers.c.
What do you think?

Thanks,
Rong

>=20
> > +	len =3D sysfs_emit(buf, "%s%s%s\n",
> > +			 offloaded ? "[" : (hit ? "<" : ""),
> > +			 led_cdev->hw_control_trigger,
> > +			 offloaded ? "]" : (hit ? ">" : ""));
> > +
> > +	return len;
> > +}
> > +EXPORT_SYMBOL_GPL(trigger_may_offload_show);
> > +
> >  /* LED Trigger Interface */
> > =20
> >  int led_trigger_register(struct led_trigger *trig)
> > diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> > index bee46651e068..b08a289397e4 100644
> > --- a/drivers/leds/leds.h
> > +++ b/drivers/leds/leds.h
> > @@ -27,6 +27,8 @@ ssize_t led_trigger_read(struct file *filp, struct ko=
bject *kobj,
> >  ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> >  			const struct bin_attribute *bin_attr, char *buf,
> >  			loff_t pos, size_t count);
> > +ssize_t trigger_may_offload_show(struct device *dev,
> > +				 struct device_attribute *attr, char *buf);
> > =20
> >  extern struct rw_semaphore leds_list_lock;
> >  extern struct list_head leds_list;
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index d778709f5b1b..bee2b4309a09 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -485,6 +485,7 @@ struct led_trigger {
> >  	const char	 *name;
> >  	int		(*activate)(struct led_classdev *led_cdev);
> >  	void		(*deactivate)(struct led_classdev *led_cdev);
> > +	bool		(*offloaded)(struct led_classdev *led_cdev);
> > =20
> >  	/* Brightness set by led_trigger_event */
> >  	enum led_brightness brightness;
> >=20
> > --=20
> > 2.55.0
> >=20
