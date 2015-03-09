From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH RFC] leds: Add status code trigger
Date: Mon, 9 Mar 2015 14:15:26 -0700
Message-ID: <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
References: <1424334377.11286.3.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:36735 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753019AbbCIVPr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2015 17:15:47 -0400
In-Reply-To: <1424334377.11286.3.camel@localhost>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Rapha=C3=ABl_Teysseyre?= <rteysseyre@gmail.com>, Pavel Machek <pavel@ucw.cz>, Joe Xue <lgxue@hotmail.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Thu, Feb 19, 2015 at 12:26 AM, Rapha=C3=ABl Teysseyre
<rteysseyre@gmail.com> wrote:
> Hi all,
>
> Here is a new trigger. It would allow userspace to make an LED
> blink with a pattern to show a status (or error) code to a human.
> This is useful for embedded systems without screen or network
> access. Obviously, the LED will keep on blinking even if userspace
> crashes.
>

Thanks for bringing up this. We did get similar idea and patches
before. The problem is people are seeking more complicated
applications like define a script language to do blink such as
"~~~xxxxx~x~x" and there is a decoder to translate this script to
program the leds.

It was pointed out we need another API between kernel and user space,
but I don't have such time to do that.

I will add more people to review this patch and discuss this new featur=
e.

-Bryan


> This trigger exports three properties to sysfs when activated:
> Nblink, period, and pause. It makes the LED blink "Nblink" times
> with a period of "period" milliseconds, then pause for "pause"
> milliseconds, and repeat.
>
> It's been tested on an ARM architecture (Xilinx Zynq 7010 SoC,
> which CPU is a dual ARM Cortex-A9), with a non-mainline
> kernel (xilinx-v2014.4, based of a 3.17.0 kernel).
> Unfortunately, I don't have other hardware to test it on.
> It compiles fine in a 3.19.0-rc1 source tree.
>
> Additional testing and comments would be appreciated.
> Do the properties names seem appropriate to you ? I hesitated
> between Nblink, N_blink, nblink, and n_blink.
>
> Best regards,
>
> Signed-off-by: Rapha=C3=ABl Teysseyre <rteysseyre@gmail.com>
> ---
>  Documentation/leds/ledtrig-statuscode.txt |   41 ++++++
>  drivers/leds/trigger/Kconfig              |    9 ++
>  drivers/leds/trigger/Makefile             |    1 +
>  drivers/leds/trigger/ledtrig-statuscode.c |  194 +++++++++++++++++++=
++++++++++
>  4 files changed, 245 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/leds/ledtrig-statuscode.txt
>  create mode 100644 drivers/leds/trigger/ledtrig-statuscode.c
>
> diff --git a/Documentation/leds/ledtrig-statuscode.txt b/Documentatio=
n/leds/ledtrig-statuscode.txt
> new file mode 100644
> index 0000000..f5ea3ac
> --- /dev/null
> +++ b/Documentation/leds/ledtrig-statuscode.txt
> @@ -0,0 +1,41 @@
> +LED Status code Trigger
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This trigger allows userspace to make a LED blink with a pattern
> +to show a status (or error) code to a human.
> +
> +Use case : this can be useful for an embedded system without screen
> +or network access. An LED with this trigger can be used to convey
> +a basic "status code" to the final user. If user space crashes,
> +the LED will keep on blinking, which might help debugging the system=
=2E
> +
> +This trigger exports three properties : period, pause, and Nblink.
> +The LED will blink "Nblink" times with a period of "period" millisec=
onds,
> +then pause for "pause" milliseconds, and repeat.
> +
> +When the trigger is activated, its properties are set to default val=
ues.
> +
> +       Nblink : Number of LED blinks per cycle. Default value : 1.
> +
> +       period : Period length (in milliseconds). The LED will blink
> +               with this period, with a 50% duty cycle.
> +               Default value : 1000.
> +
> +       pause :  Pause duration (in milliseconds) between each cycle.
> +               Every Nblink blinks, the LED will stay off for this
> +               duration. Default value : 1000.
> +
> +For example, if Nblink =3D 3, period =3D 1000, and pause =3D 2000,
> +the LED will blink with the following pattern :
> +
> + ...OFF  |  ON  |  OFF |  ON  |  OFF |  ON  |         OFF           =
    |   ON  |  OFF...
> +          <     1s    > <     1s    > <0.5s> <            2s        =
   >
> +
> +To get this pattern, the user will have to do :
> +       echo statuscode > trigger
> +       echo 3 > Nblink
> +       echo 1000 > period
> +       echo 2000 > pause
> +
> +When ON the LED will be driven at its max_brightness property. When =
the trigger
> +is deactivated, the LED is returned to the OFF state.
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kcon=
fig
> index 49794b4..09f0df5 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -108,4 +108,13 @@ config LEDS_TRIGGER_CAMERA
>           This enables direct flash/torch on/off by the driver, kerne=
l space.
>           If unsure, say Y.
>
> +config LEDS_TRIGGER_STATUSCODE
> +       tristate "LED StatusCode Trigger"
> +       depends on LEDS_TRIGGERS
> +       help
> +         This allows LEDs blinking with a pattern. Can be useful on =
embedded
> +         systems with no screen to give out a status code to a human=
=2E
> +
> +         If unsure, say N.
> +
>  endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Mak=
efile
> index 1abf48d..8c09e77 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_LEDS_TRIGGER_CPU)          +=3D ledtrig-=
cpu.o
>  obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)  +=3D ledtrig-default-on.o
>  obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)   +=3D ledtrig-transient.o
>  obj-$(CONFIG_LEDS_TRIGGER_CAMERA)      +=3D ledtrig-camera.o
> +obj-$(CONFIG_LEDS_TRIGGER_STATUSCODE)   +=3D ledtrig-statuscode.o
> diff --git a/drivers/leds/trigger/ledtrig-statuscode.c b/drivers/leds=
/trigger/ledtrig-statuscode.c
> new file mode 100644
> index 0000000..7f0e7ae
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-statuscode.c
> @@ -0,0 +1,194 @@
> +/*
> + * Status code trigger
> + *
> + * Copyright 2015, Epsiline
> + *
> + * Author : Rapha=C3=ABl Teysseyre <rteysseyre@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include "../leds.h"
> +
> +struct statuscode_trig_data {
> +       unsigned int period;
> +       unsigned int pause;
> +       unsigned int Nblink;
> +       unsigned int phase;
> +       struct timer_list timer;
> +};
> +
> +static const struct statuscode_trig_data STATUSCODE_TRIG_DATA_DEFAUL=
T =3D {
> +       .period =3D 1000,
> +       .pause =3D 1000,
> +       .Nblink =3D 1,
> +       .phase =3D (unsigned int) -1, /* The first call to
> +                                      statuscode_trig_update()
> +                                      will increment this to zero */
> +       .timer =3D TIMER_INITIALIZER(NULL, 0, 0),
> +};
> +
> +/* --- Sysfs handling --- */
> +
> +#define statuscode_trig_create_attribute(name)                      =
   \
> +                                                                    =
   \
> +       static ssize_t statuscode_trig_show_ ## name                 =
   \
> +       (struct device *dev, struct device_attribute *attr, char *buf=
)  \
> +       {                                                            =
   \
> +               struct led_classdev *led_cdev =3D dev_get_drvdata(dev=
);   \
> +               struct statuscode_trig_data *data =3D led_cdev->trigg=
er_data; \
> +               return scnprintf(buf, PAGE_SIZE, "%u\n", data->name);=
   \
> +       }                                                            =
   \
> +                                                                    =
   \
> +       static ssize_t statuscode_trig_store_ ## name                =
   \
> +       (struct device *dev, struct device_attribute *attr,          =
   \
> +               const char *buf, size_t count)                       =
   \
> +       {                                                            =
   \
> +               struct led_classdev *led_cdev =3D dev_get_drvdata(dev=
);   \
> +               struct statuscode_trig_data *data =3D led_cdev->trigg=
er_data; \
> +               unsigned int res;                                    =
   \
> +               int err =3D kstrtouint(buf, 10, &res);               =
     \
> +               if (err)                                             =
   \
> +                       return err;                                  =
   \
> +               data->name =3D res;                                  =
     \
> +               return count;                                        =
   \
> +       }                                                            =
   \
> +                                                                    =
   \
> +       DEVICE_ATTR(name, S_IRUGO | S_IWUSR,                         =
   \
> +               statuscode_trig_show_ ## name, statuscode_trig_store_=
 ## name) \
> +
> +statuscode_trig_create_attribute(period);
> +statuscode_trig_create_attribute(pause);
> +statuscode_trig_create_attribute(Nblink);
> +
> +static int statuscode_trig_create_sysfs_files(struct device *dev)
> +{
> +       int err;
> +
> +       err =3D device_create_file(dev, &dev_attr_period);
> +       if (err)
> +               return err;
> +
> +       err =3D device_create_file(dev, &dev_attr_pause);
> +       if (err)
> +               goto err_pause;
> +
> +       err =3D device_create_file(dev, &dev_attr_Nblink);
> +       if (err)
> +               goto err_Nblink;
> +
> +       return 0;
> +
> +err_Nblink:
> +       device_remove_file(dev, &dev_attr_pause);
> +err_pause:
> +       device_remove_file(dev, &dev_attr_period);
> +       return err;
> +}
> +
> +static void statuscode_trig_remove_sysfs_files(struct device *dev)
> +{
> +       device_remove_file(dev, &dev_attr_Nblink);
> +       device_remove_file(dev, &dev_attr_pause);
> +       device_remove_file(dev, &dev_attr_period);
> +}
> +
> +/* --- Led intensity updating --- */
> +
> +/*
> + * For Nblink =3D 3 :
> + * LED intensity :
> + *       +---+   +---+   +---+         +---+   +---+   +---+
> + * ------+   +---+   +---+   +---------+   +---+   +---+   +------
> + * Phase :
> + *    0  | 1 | 2 | 3 | 4 | 5 |    0    | 1 | 2 | 3 | 4 | 5 |   0
> + *
> + */
> +
> +static void statuscode_trig_update(unsigned long led_cdev_ptr)
> +{
> +       struct led_classdev *led_cdev =3D (struct led_classdev *) led=
_cdev_ptr;
> +       struct statuscode_trig_data *data =3D led_cdev->trigger_data;
> +
> +       data->phase++;
> +       if (data->phase >=3D 2 * data->Nblink)
> +               data->phase =3D 0;
> +
> +       if (data->phase % 2)
> +               led_set_brightness(led_cdev, led_cdev->max_brightness=
);
> +       else
> +               led_set_brightness(led_cdev, LED_OFF);
> +
> +       if (data->phase =3D=3D 0)
> +               mod_timer(&data->timer, jiffies +
> +                       msecs_to_jiffies(data->pause));
> +       else
> +               mod_timer(&data->timer, jiffies +
> +                       msecs_to_jiffies(data->period / 2));
> +}
> +
> +/* --- Activate / deactivate trigger --- */
> +
> +static void statuscode_trig_activate(struct led_classdev *led_cdev)
> +{
> +       struct statuscode_trig_data *data =3D NULL;
> +
> +       data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return;
> +
> +       led_cdev->trigger_data =3D data;
> +
> +       *data =3D STATUSCODE_TRIG_DATA_DEFAULT;
> +       setup_timer(&data->timer,
> +               statuscode_trig_update,
> +               (unsigned long) led_cdev);
> +
> +       statuscode_trig_create_sysfs_files(led_cdev->dev);
> +       statuscode_trig_update(data->timer.data);
> +}
> +
> +static void statuscode_trig_deactivate(struct led_classdev *led_cdev=
)
> +{
> +       struct statuscode_trig_data *data =3D led_cdev->trigger_data;
> +
> +       if (data) {
> +               statuscode_trig_remove_sysfs_files(led_cdev->dev);
> +               del_timer_sync(&data->timer);
> +               led_set_brightness(led_cdev, LED_OFF);
> +               kfree(data);
> +               led_cdev->trigger_data =3D NULL;
> +       }
> +}
> +
> +/* --- Module loading/unloading --- */
> +
> +static struct led_trigger statuscode_led_trigger =3D {
> +       .name =3D "statuscode",
> +       .activate =3D statuscode_trig_activate,
> +       .deactivate =3D statuscode_trig_deactivate,
> +};
> +
> +static int __init statuscode_trig_init(void)
> +{
> +       return led_trigger_register(&statuscode_led_trigger);
> +}
> +
> +static void __exit statuscode_trig_exit(void)
> +{
> +       led_trigger_unregister(&statuscode_led_trigger);
> +}
> +
> +module_init(statuscode_trig_init);
> +module_exit(statuscode_trig_exit);
> +
> +MODULE_AUTHOR("Raphael Teysseyre <rteysseyre@gmail.com");
> +MODULE_DESCRIPTION("Statuscode LED trigger");
> +MODULE_LICENSE("GPL");
> --
> 1.7.1
>
>
>
