From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 6/6] leds: netdev trigger: allow setting initial values
 in device tree
Date: Thu, 14 Mar 2019 15:24:56 +0100
Message-ID: <742bd6b2-0a11-858e-d727-204b0313265e@gmail.com>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-7-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314140619.3309-7-linux@rasmusvillemoes.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Rasmus,

Thank you for the update.
Still, there is one thing to improve.

On 3/14/19 3:06 PM, Rasmus Villemoes wrote:
> It can be quite convenient to initialize a netdev-triggered LED with a
> device name and setting the rx,tx,link properties from device tree,
> instead of having to do that in an init script (or udev rule) in
> userspace.
> 
> My main motivation for this is to be able to switch away from the
> deprecated CONFIG_CAN_LEDS. The example added to common.txt
> corresponds to switching linux,default-trigger = "can0-rxtx" to
> "netdev" and adding the indicated netdev subnode.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   .../devicetree/bindings/leds/common.txt       | 11 +++++++
>   drivers/leds/trigger/ledtrig-netdev.c         | 30 +++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 7cb88460a47c..f8078c4cf6f8 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -43,6 +43,17 @@ Optional properties for child nodes:
>                   Documentation/ABI/testing/sysfs-class-led-trigger-netdev)
>                   to reflect the state and activity of a net device.
>   
> +                The optional child node netdev can be used to
> +                configure initial values for the link, rx, tx and
> +                device_name properties. For example,
> +
> +                netdev {
> +                    rx;
> +                    tx;
> +                    link;
> +                    device-name = "can0";
> +                };
> +
>   - led-pattern : Array of integers with default pattern for certain triggers.
>                   Each trigger may parse this property differently:
>                   - one-shot : two numbers specifying delay on and delay off (in ms),
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index e4a76ce4e4c7..387932cfea55 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -20,6 +20,7 @@
>   #include <linux/list.h>
>   #include <linux/module.h>
>   #include <linux/netdevice.h>
> +#include <linux/of.h>
>   #include <linux/spinlock.h>
>   #include <linux/timer.h>
>   #include "../leds.h"
> @@ -400,6 +401,33 @@ static void netdev_trig_work(struct work_struct *work)
>   			(atomic_read(&trigger_data->interval)*2));
>   }
>   
> +static void netdev_trig_of_init(struct led_classdev *led_cdev,
> +				struct led_netdev_data *trigger_data)
> +{
> +	struct device_node *np = led_cdev->dev->of_node;
> +	const char *device_name;
> +
> +	if (!np)
> +		return;
> +	np = of_get_child_by_name(np, "netdev");
> +	if (!np)
> +		return;
> +
> +	if (of_property_read_bool(np, "link"))
> +		__set_bit(NETDEV_LED_LINK, &trigger_data->mode);
> +	if (of_property_read_bool(np, "tx"))
> +		__set_bit(NETDEV_LED_TX, &trigger_data->mode);
> +	if (of_property_read_bool(np, "rx"))
> +		__set_bit(NETDEV_LED_RX, &trigger_data->mode);
> +	if (!of_property_read_string(np, "device-name", &device_name))
> +		netdev_trig_set_device(trigger_data, device_name,
> +				       strlen(device_name));
> +
> +	set_baseline_state(trigger_data);
> +
> +	of_node_put(np);
> +}
> +
>   static int netdev_trig_activate(struct led_classdev *led_cdev)
>   {
>   	struct led_netdev_data *trigger_data;
> @@ -423,6 +451,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
>   	trigger_data->mode = 0;
>   	atomic_set(&trigger_data->interval, msecs_to_jiffies(50));
>   	trigger_data->last_activity = 0;
> +	if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER)
> +		netdev_trig_of_init(led_cdev, trigger_data);

We don't necessarily want OF settings to be used for initialization on
each LED trigger activation for the LED class device, but only on the
first one. That's why the triggers using this flags clean it here:

led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;

>   
>   	led_set_trigger_data(led_cdev, trigger_data);
>   
> 

-- 
Best regards,
Jacek Anaszewski
