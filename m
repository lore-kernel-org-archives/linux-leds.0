From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: convert blink timer to workqueue
Date: Thu, 3 Jul 2014 12:02:00 -0700
Message-ID: <CAK5ve-JSn8Ugx3vN7Zz5rx0eF5VB3n5BwLwDLVbM878YLwagNQ@mail.gmail.com>
References: <1402737700-2830-1-git-send-email-vincent.donnefort@seagate.com>
 <CAK5ve-JWGqUpZ-WpZjAs4LiJU66BkSyw5FbP7RYbdBpsi0anDw@mail.gmail.com>
 <20140626090055.GA31066@ns3274321.ip-5-39-88.eu> <20140703090538.GA9503@ns3274321.ip-5-39-88.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:46807 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336AbaGCTCW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 3 Jul 2014 15:02:22 -0400
Received: by mail-la0-f45.google.com with SMTP id hr17so491726lab.32
        for <linux-leds@vger.kernel.org>; Thu, 03 Jul 2014 12:02:21 -0700 (PDT)
In-Reply-To: <20140703090538.GA9503@ns3274321.ip-5-39-88.eu>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Jul 3, 2014 at 2:05 AM, Vincent Donnefort <vdonnefort@gmail.com> wrote:
> On Thu, Jun 26, 2014 at 11:00:55AM +0200, Vincent Donnefort wrote:
>> On Wed, Jun 25, 2014 at 03:52:33PM -0700, Bryan Wu wrote:
>> > On Sat, Jun 14, 2014 at 2:21 AM, Vincent Donnefort <vdonnefort@gmail.com> wrote:
>> > > From: Vincent Donnefort <vdonnefort@gmail.com>
>> > >
>> > > This patch converts the blink timer from led-core to workqueue which is more
>> > > suitable for this kind of non-priority operations. Moreover, timer may lead to
>> > > errors when a LED setting function use a scheduling function such as pinctrl
>> > > which is using mutex.
>> > >
>> >
>> > Actually I prefer to use workqueue here, too. But I'd like to know
>> > more details about the error you mentioned here.
>>
>> There is for now none driver using pinctrl, this example was bad since taken on a
>> driver which has not been merged yet.
>>
>> However the same problem appears for drivers which needs gpio_cansleep
>> and so needs their own workqueue.
>>
>
> Do you need more precisions? Do you want me to change the commit message?
>

I will merge this into my devel branch and let people do some testing.
If there is no problem, I will move it to for-next branch.

Thanks,
-Bryan

> Regards,
> Vincent.
>
>> >
>> > Any test case?
>> >
>> > Thanks,
>> > -Bryan
>> >
>> > > Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>
>> > >
>> > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> > > index f37d63c..0567a24 100644
>> > > --- a/drivers/leds/led-class.c
>> > > +++ b/drivers/leds/led-class.c
>> > > @@ -15,10 +15,10 @@
>> > >  #include <linux/list.h>
>> > >  #include <linux/spinlock.h>
>> > >  #include <linux/device.h>
>> > > -#include <linux/timer.h>
>> > >  #include <linux/err.h>
>> > >  #include <linux/ctype.h>
>> > >  #include <linux/leds.h>
>> > > +#include <linux/workqueue.h>
>> > >  #include "leds.h"
>> > >
>> > >  static struct class *leds_class;
>> > > @@ -97,9 +97,10 @@ static const struct attribute_group *led_groups[] = {
>> > >         NULL,
>> > >  };
>> > >
>> > > -static void led_timer_function(unsigned long data)
>> > > +static void led_work_function(struct work_struct *ws)
>> > >  {
>> > > -       struct led_classdev *led_cdev = (void *)data;
>> > > +       struct led_classdev *led_cdev =
>> > > +               container_of(ws, struct led_classdev, blink_work.work);
>> > >         unsigned long brightness;
>> > >         unsigned long delay;
>> > >
>> > > @@ -143,7 +144,8 @@ static void led_timer_function(unsigned long data)
>> > >                 }
>> > >         }
>> > >
>> > > -       mod_timer(&led_cdev->blink_timer, jiffies + msecs_to_jiffies(delay));
>> > > +       queue_delayed_work(system_wq, &led_cdev->blink_work,
>> > > +                          msecs_to_jiffies(delay));
>> > >  }
>> > >
>> > >  static void set_brightness_delayed(struct work_struct *ws)
>> > > @@ -230,9 +232,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>> > >
>> > >         INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
>> > >
>> > > -       init_timer(&led_cdev->blink_timer);
>> > > -       led_cdev->blink_timer.function = led_timer_function;
>> > > -       led_cdev->blink_timer.data = (unsigned long)led_cdev;
>> > > +       INIT_DELAYED_WORK(&led_cdev->blink_work, led_work_function);
>> > >
>> > >  #ifdef CONFIG_LEDS_TRIGGERS
>> > >         led_trigger_set_default(led_cdev);
>> > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> > > index 71b40d3..4bb1168 100644
>> > > --- a/drivers/leds/led-core.c
>> > > +++ b/drivers/leds/led-core.c
>> > > @@ -16,6 +16,7 @@
>> > >  #include <linux/module.h>
>> > >  #include <linux/rwsem.h>
>> > >  #include <linux/leds.h>
>> > > +#include <linux/workqueue.h>
>> > >  #include "leds.h"
>> > >
>> > >  DECLARE_RWSEM(leds_list_lock);
>> > > @@ -51,7 +52,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>> > >                 return;
>> > >         }
>> > >
>> > > -       mod_timer(&led_cdev->blink_timer, jiffies + 1);
>> > > +       queue_delayed_work(system_wq, &led_cdev->blink_work, 1);
>> > >  }
>> > >
>> > >
>> > > @@ -75,7 +76,7 @@ void led_blink_set(struct led_classdev *led_cdev,
>> > >                    unsigned long *delay_on,
>> > >                    unsigned long *delay_off)
>> > >  {
>> > > -       del_timer_sync(&led_cdev->blink_timer);
>> > > +       cancel_delayed_work_sync(&led_cdev->blink_work);
>> > >
>> > >         led_cdev->flags &= ~LED_BLINK_ONESHOT;
>> > >         led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
>> > > @@ -90,7 +91,7 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
>> > >                            int invert)
>> > >  {
>> > >         if ((led_cdev->flags & LED_BLINK_ONESHOT) &&
>> > > -            timer_pending(&led_cdev->blink_timer))
>> > > +            delayed_work_pending(&led_cdev->blink_work))
>> > >                 return;
>> > >
>> > >         led_cdev->flags |= LED_BLINK_ONESHOT;
>> > > @@ -107,7 +108,7 @@ EXPORT_SYMBOL(led_blink_set_oneshot);
>> > >
>> > >  void led_stop_software_blink(struct led_classdev *led_cdev)
>> > >  {
>> > > -       del_timer_sync(&led_cdev->blink_timer);
>> > > +       cancel_delayed_work_sync(&led_cdev->blink_work);
>> > >         led_cdev->blink_delay_on = 0;
>> > >         led_cdev->blink_delay_off = 0;
>> > >  }
>> > > @@ -116,7 +117,7 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
>> > >  void led_set_brightness(struct led_classdev *led_cdev,
>> > >                         enum led_brightness brightness)
>> > >  {
>> > > -       /* delay brightness setting if need to stop soft-blink timer */
>> > > +       /* delay brightness setting if need to stop soft-blink work */
>> > >         if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>> > >                 led_cdev->delayed_set_value = brightness;
>> > >                 schedule_work(&led_cdev->set_brightness_work);
>> > > diff --git a/include/linux/leds.h b/include/linux/leds.h
>> > > index 0287ab2..89af7b8 100644
>> > > --- a/include/linux/leds.h
>> > > +++ b/include/linux/leds.h
>> > > @@ -15,7 +15,6 @@
>> > >  #include <linux/list.h>
>> > >  #include <linux/spinlock.h>
>> > >  #include <linux/rwsem.h>
>> > > -#include <linux/timer.h>
>> > >  #include <linux/workqueue.h>
>> > >
>> > >  struct device;
>> > > @@ -67,7 +66,7 @@ struct led_classdev {
>> > >         const char              *default_trigger;       /* Trigger to use */
>> > >
>> > >         unsigned long            blink_delay_on, blink_delay_off;
>> > > -       struct timer_list        blink_timer;
>> > > +       struct delayed_work      blink_work;
>> > >         int                      blink_brightness;
>> > >
>> > >         struct work_struct      set_brightness_work;
>> > > --
>> > > 1.9.1
>> > >
