From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/2] leds: trigger: gpio: make ledtrig-gpio useable with
 GPIO drivers requiring threaded irqs
Date: Thu, 11 Sep 2014 17:32:40 -0700
Message-ID: <CAK5ve-+BCvfHZ-JrYD_48KYzaZGE0as=eMe0+XPbgh5DfH9qRw@mail.gmail.com>
References: <1410248433-24005-1-git-send-email-LW@KARO-electronics.de> <1410248433-24005-3-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:35102 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbaILAdD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 11 Sep 2014 20:33:03 -0400
In-Reply-To: <1410248433-24005-3-git-send-email-LW@KARO-electronics.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Tue, Sep 9, 2014 at 12:40 AM, Lothar Wa=C3=9Fmann <LW@karo-electroni=
cs.de> wrote:
> When trying to use the LED GPIO trigger with e.g. the PCA953x GPIO
> driver, request_irq() fails with -EINVAL, because the GPIO driver
> requires a nested interrupt handler.
>
> Use request_any_context_irq() to be able to use any GPIO driver as LE=
D
> trigger.
>

Hmmm, what about use request_thread_irq() and put the gpio_trig_work()
in as the thread_func.

=46elipe, can you take a look at this?

Also in the first patch:
Actually in gpio_trig_irq(), it said:
/* just schedule_work since gpio_get_value can sleep */
        schedule_work(&gpio_data->work);

Then that means we need to call gpio_get_value_can_sleep() in the
gpio_trig_work() instead of gpio_get_value(), right?

Thanks,
-Bryan


> Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> ---
>  drivers/leds/trigger/ledtrig-gpio.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigg=
er/ledtrig-gpio.c
> index c86c418..b4168a7 100644
> --- a/drivers/leds/trigger/ledtrig-gpio.c
> +++ b/drivers/leds/trigger/ledtrig-gpio.c
> @@ -161,10 +161,10 @@ static ssize_t gpio_trig_gpio_store(struct devi=
ce *dev,
>                 return n;
>         }
>
> -       ret =3D request_irq(gpio_to_irq(gpio), gpio_trig_irq,
> +       ret =3D request_any_context_irq(gpio_to_irq(gpio), gpio_trig_=
irq,
>                         IRQF_SHARED | IRQF_TRIGGER_RISING
>                         | IRQF_TRIGGER_FALLING, "ledtrig-gpio", led);
> -       if (ret) {
> +       if (ret < 0) {
>                 dev_err(dev, "request_irq failed with error %d\n", re=
t);
>         } else {
>                 if (gpio_data->gpio !=3D 0)
> @@ -172,7 +172,7 @@ static ssize_t gpio_trig_gpio_store(struct device=
 *dev,
>                 gpio_data->gpio =3D gpio;
>         }
>
> -       return ret ? ret : n;
> +       return ret < 0 ? ret : n;
>  }
>  static DEVICE_ATTR(gpio, 0644, gpio_trig_gpio_show, gpio_trig_gpio_s=
tore);
>
> --
> 1.7.10.4
>
