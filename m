From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7] leds: class: Add new optional brightness_hw_changed
 attribute
Date: Fri, 27 Jan 2017 12:58:40 +0100
Message-ID: <20170127115840.GA8512@amd>
References: <20170127074135.3748-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170127074135.3748-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-01-27 08:41:35, Hans de Goede wrote:
> Some LEDs may have their brightness level changed autonomously
> (outside of kernel control) by hardware / firmware. This commit
> adds support for an optional brightness_hw_changed attribute to
> signal such changes to userspace (if a driver can detect them):
>=20
> What:		/sys/class/leds/<led>/brightness_hw_changed
> Date:		January 2017
> KernelVersion:	4.11
> Description:
> 		Last hardware set brightness level for this LED. Some LEDs
> 		may be changed autonomously by hardware/firmware. Only LEDs
> 		where this happens and the driver can detect this, will
> 		have this file.
>=20
> 		This file supports poll() to detect when the hardware
> 		changes the brightness.
>=20
> 		Reading this file will return the last brightness level set
> 		by the hardware, this may be different from the current
> 		brightness.
>=20
> Drivers which want to support this, simply add LED_BRIGHT_HW_CHANGED to
> their flags field and call led_classdev_notify_brightness_hw_changed()
> with the hardware set brightness when they detect a hardware / firmware
> triggered brightness change.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

> ---
> Changes in v6:
> -New patch in v6 of this set, replacing previous trigger based API
> Changes in v7
> -Return -ENODATA when brightness_hw_changed gets read before any
>  hw brightness change event as happened
> -Make the hw_brightness_changed attr presence configurable through Kconfig
> ---
>  Documentation/ABI/testing/sysfs-class-led | 17 +++++++
>  drivers/leds/Kconfig                      |  9 ++++
>  drivers/leds/led-class.c                  | 73 +++++++++++++++++++++++++=
++++++
>  include/linux/leds.h                      | 15 +++++++
>  4 files changed, 114 insertions(+)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/AB=
I/testing/sysfs-class-led
> index 491cdee..5f67f7a 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -23,6 +23,23 @@ Description:
>  		If the LED does not support different brightness levels, this
>  		should be 1.
> =20
> +What:		/sys/class/leds/<led>/brightness_hw_changed
> +Date:		January 2017
> +KernelVersion:	4.11
> +Description:
> +		Last hardware set brightness level for this LED. Some LEDs
> +		may be changed autonomously by hardware/firmware. Only LEDs
> +		where this happens and the driver can detect this, will have
> +		this file.
> +
> +		This file supports poll() to detect when the hardware changes
> +		the brightness.
> +
> +		Reading this file will return the last brightness level set
> +		by the hardware, this may be different from the current
> +		brightness. Reading this file when no hw brightness change
> +		event has happened will return an ENODATA error.
> +
>  What:		/sys/class/leds/<led>/trigger
>  Date:		March 2006
>  KernelVersion:	2.6.17
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index c621cbb..275f467 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -29,6 +29,15 @@ config LEDS_CLASS_FLASH
>  	  for the flash related features of a LED device. It can be built
>  	  as a module.
> =20
> +config LEDS_BRIGHTNESS_HW_CHANGED
> +	bool "LED Class brightness_hw_changed attribute support"
> +	depends on LEDS_CLASS
> +	help
> +	  This option enables support for the brightness_hw_changed attribute
> +	  for led sysfs class devices under /sys/class/leds.
> +
> +	  See Documentation/ABI/testing/sysfs-class-led for details.
> +
>  comment "LED drivers"
> =20
>  config LEDS_88PM860X
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 326ee6e..2f8c843 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -103,6 +103,65 @@ static const struct attribute_group *led_groups[] =
=3D {
>  	NULL,
>  };
> =20
> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
> +static ssize_t brightness_hw_changed_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +
> +	if (led_cdev->brightness_hw_changed =3D=3D -1)
> +		return -ENODATA;
> +
> +	return sprintf(buf, "%u\n", led_cdev->brightness_hw_changed);
> +}
> +
> +static DEVICE_ATTR_RO(brightness_hw_changed);
> +
> +static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
> +{
> +	struct device *dev =3D led_cdev->dev;
> +	int ret;
> +
> +	ret =3D device_create_file(dev, &dev_attr_brightness_hw_changed);
> +	if (ret) {
> +		dev_err(dev, "Error creating brightness_hw_changed\n");
> +		return ret;
> +	}
> +
> +	led_cdev->brightness_hw_changed_kn =3D
> +		sysfs_get_dirent(dev->kobj.sd, "brightness_hw_changed");
> +	if (!led_cdev->brightness_hw_changed_kn) {
> +		dev_err(dev, "Error getting brightness_hw_changed kn\n");
> +		device_remove_file(dev, &dev_attr_brightness_hw_changed);
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void led_remove_brightness_hw_changed(struct led_classdev *led_cd=
ev)
> +{
> +	sysfs_put(led_cdev->brightness_hw_changed_kn);
> +	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
> +}
> +
> +void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_=
cdev,
> +					       enum led_brightness brightness)
> +{
> +	led_cdev->brightness_hw_changed =3D brightness;
> +	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);
> +#else
> +static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
> +{
> +	return 0;
> +}
> +static void led_remove_brightness_hw_changed(struct led_classdev *led_cd=
ev)
> +{
> +}
> +#endif
> +
>  /**
>   * led_classdev_suspend - suspend an led_classdev.
>   * @led_cdev: the led_classdev to suspend.
> @@ -204,10 +263,21 @@ int led_classdev_register(struct device *parent, st=
ruct led_classdev *led_cdev)
>  		dev_warn(parent, "Led %s renamed to %s due to name collision",
>  				led_cdev->name, dev_name(led_cdev->dev));
> =20
> +	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
> +		ret =3D led_add_brightness_hw_changed(led_cdev);
> +		if (ret) {
> +			device_unregister(led_cdev->dev);
> +			return ret;
> +		}
> +	}
> +
>  	led_cdev->work_flags =3D 0;
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	init_rwsem(&led_cdev->trigger_lock);
>  #endif
> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
> +	led_cdev->brightness_hw_changed =3D -1;
> +#endif
>  	mutex_init(&led_cdev->led_access);
>  	/* add to the list of leds */
>  	down_write(&leds_list_lock);
> @@ -256,6 +326,9 @@ void led_classdev_unregister(struct led_classdev *led=
_cdev)
> =20
>  	flush_work(&led_cdev->set_brightness_work);
> =20
> +	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
> +		led_remove_brightness_hw_changed(led_cdev);
> +
>  	device_unregister(led_cdev->dev);
> =20
>  	down_write(&leds_list_lock);
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 569cb53..c771153 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -13,6 +13,7 @@
>  #define __LINUX_LEDS_H_INCLUDED
> =20
>  #include <linux/device.h>
> +#include <linux/kernfs.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/rwsem.h>
> @@ -46,6 +47,7 @@ struct led_classdev {
>  #define LED_DEV_CAP_FLASH	(1 << 18)
>  #define LED_HW_PLUGGABLE	(1 << 19)
>  #define LED_PANIC_INDICATOR	(1 << 20)
> +#define LED_BRIGHT_HW_CHANGED	(1 << 21)
> =20
>  	/* set_brightness_work / blink_timer flags, atomic, private. */
>  	unsigned long		work_flags;
> @@ -110,6 +112,11 @@ struct led_classdev {
>  	bool			activated;
>  #endif
> =20
> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
> +	int			 brightness_hw_changed;
> +	struct kernfs_node	*brightness_hw_changed_kn;
> +#endif
> +
>  	/* Ensures consistent access to the LED Flash Class device */
>  	struct mutex		led_access;
>  };
> @@ -422,4 +429,12 @@ static inline void ledtrig_cpu(enum cpu_led_event ev=
t)
>  }
>  #endif
> =20
> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
> +extern void led_classdev_notify_brightness_hw_changed(
> +	struct led_classdev *led_cdev, enum led_brightness brightness);
> +#else
> +static inline void led_classdev_notify_brightness_hw_changed(
> +	struct led_classdev *led_cdev, enum led_brightness brightness) { }
> +#endif
> +
>  #endif		/* __LINUX_LEDS_H_INCLUDED */

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAliLNfAACgkQMOfwapXb+vK5vQCfQT3YsRUOdckwFbL2ocD1Z1wZ
kVkAn1MuQzt9IFIMfvYFPbZ2Ww/VaVGM
=aPp3
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
