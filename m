From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v7 1/2] leds: core: Introduce LED pattern trigger
Date: Mon, 3 Sep 2018 20:58:50 +0200
Message-ID: <ef266d4a-ba0e-cba6-ae30-ebbf730e28a2@gmail.com>
References: <e6d4e7be537a4e4d6fce26c6d446703b1910eab9.1535700092.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e6d4e7be537a4e4d6fce26c6d446703b1910eab9.1535700092.git.baolin.wang@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: pavel@ucw.cz, bjorn.andersson@linaro.org
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Baolin,

Thank you for the update.

Please find my remarks below.

On 08/31/2018 09:52 AM, Baolin Wang wrote:
> This patch adds one new led trigger that LED device can configure
> the software or hardware pattern and trigger it.
> 
> Consumers can write 'pattern' file to enable the software pattern
> which alters the brightness for the specified duration with one
> software timer.
> 
> Moreover consumers can write 'hw_pattern' file to enable the hardware
> pattern for some LED controllers which can autonomously control
> brightness over time, according to some preprogrammed hardware
> patterns.
> 
> Signed-off-by: Raphael Teysseyre <rteysseyre@gmail.com>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes from v6:
>  - Improve commit message.
>  - Optimize the description of the hw_pattern file.
>  - Simplify some logics.
> 
> Changes from v5:
>  - Add one 'hw_pattern' file for hardware patterns.
> 
> Changes from v4:
>  - Change the repeat file to return the originally written number.
>  - Improve comments.
>  - Fix some build warnings.
> 
> Changes from v3:
>  - Reset pattern number to 0 if user provides incorrect pattern string.
>  - Support one pattern.
> 
> Changes from v2:
>  - Remove hardware_pattern boolen.
>  - Chnage the pattern string format.
> 
> Changes from v1:
>  - Use ATTRIBUTE_GROUPS() to define attributes.
>  - Introduce hardware_pattern flag to determine if software pattern
>  or hardware pattern.
>  - Re-implement pattern_trig_store_pattern() function.
>  - Remove pattern_get() interface.
>  - Improve comments.
>  - Other small optimization.
> ---
>  .../ABI/testing/sysfs-class-led-trigger-pattern    |   44 +++
>  drivers/leds/trigger/Kconfig                       |    7 +
>  drivers/leds/trigger/Makefile                      |    1 +
>  drivers/leds/trigger/ledtrig-pattern.c             |  337 ++++++++++++++++++++
>  include/linux/leds.h                               |   16 +
>  5 files changed, 405 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>  create mode 100644 drivers/leds/trigger/ledtrig-pattern.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
> new file mode 100644
> index 0000000..f4749d1
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
> @@ -0,0 +1,44 @@
> +What:		/sys/class/leds/<led>/pattern
> +Date:		September 2018
> +KernelVersion:	4.20
> +Description:
> +		Specify a software pattern for the LED, that supports altering
> +		the brightness for the specified duration with one software
> +		timer.
> +
> +		The pattern is given by a series of tuples, of brightness and
> +		duration (ms). The LED is expected to traverse the series and
> +		each brightness value for the specified duration. Duration of
> +		0 means brightness should immediately change to new value.
> +
> +		The format of the software pattern values should be:
> +		"brightness_1 duration_1 brightness_2 duration_2 brightness_3
> +		duration_3 ...".
> +
> +What:		/sys/class/leds/<led>/hw_pattern
> +Date:		September 2018
> +KernelVersion:	4.20
> +Description:
> +		Specify a hardware pattern for the LED, for LED hardware that
> +		supports autonomously controlling brightness over time, according
> +		to some preprogrammed hardware patterns.
> +
> +		Since different LED hardware can have different semantics of
> +		hardware patterns, each driver is expected to provide its own
> +		description for the hardware patterns as below.

And I would cut this description here.

> +		For Spreadtrum SC27XX LED controller, it only supports 4 hardware
> +		patterns to configure the low time, rise time, high time and fall
> +		time for the breathing mode, and each stage duration unit is 125ms.
> +		So the format of the hardware pattern values should be:
> +		"brightness_1 duration_1 brightness_2 duration_2 brightness_3
> +		 duration_3 brightness_4 duration_4".

This part should go to the separate ABI documentation file, related to
the driver for Spreadtrum SC27XX.

> +
> +What:		/sys/class/leds/<led>/repeat
> +Date:		September 2018
> +KernelVersion:	4.20
> +Description:
> +		Specify a pattern repeat number. 0 means repeat indefinitely.
> +
> +		This file will always return the originally written repeat
> +		number.
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index 4018af7..b76fc3c 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -129,4 +129,11 @@ config LEDS_TRIGGER_NETDEV
>  	  This allows LEDs to be controlled by network device activity.
>  	  If unsure, say Y.
>  
> +config LEDS_TRIGGER_PATTERN
> +	tristate "LED Pattern Trigger"
> +	help
> +	  This allows LEDs to be controlled by a software or hardware pattern
> +	  which is a series of tuples, of brightness and duration (ms).
> +	  If unsure, say N
> +
>  endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> index f3cfe19..9bcb64e 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -13,3 +13,4 @@ obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+= ledtrig-transient.o
>  obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+= ledtrig-camera.o
>  obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
>  obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
> +obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
> diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
> new file mode 100644
> index 0000000..0179191
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-pattern.c
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * LED pattern trigger
> + *
> + * Idea discussed with Pavel Machek. Raphael Teysseyre implemented
> + * the first version, Baolin Wang simplified and improved the approach.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/timer.h>
> +
> +#define MAX_PATTERNS		1024
> +
> +struct pattern_trig_data {
> +	struct led_classdev *led_cdev;
> +	struct led_pattern patterns[MAX_PATTERNS];
> +	struct led_pattern *curr;
> +	struct led_pattern *next;
> +	struct mutex lock;
> +	u32 npatterns;
> +	u32 repeat;
> +	u32 last_repeat;
> +	bool is_indefinite;
> +	bool is_hw_pattern;
> +	struct timer_list timer;
> +};
> +
> +static void pattern_trig_update_patterns(struct pattern_trig_data *data)
> +{
> +	data->curr = data->next;
> +	if (!data->is_indefinite && data->curr == data->patterns)
> +		data->repeat--;
> +
> +	if (data->next == data->patterns + data->npatterns - 1)
> +		data->next = data->patterns;
> +	else
> +		data->next++;
> +}
> +
> +static void pattern_trig_timer_function(struct timer_list *t)
> +{
> +	struct pattern_trig_data *data = from_timer(data, t, timer);
> +
> +	mutex_lock(&data->lock);
> +
> +	if (!data->is_indefinite && !data->repeat) {
> +		mutex_unlock(&data->lock);
> +		return;
> +	}
> +
> +	led_set_brightness(data->led_cdev, data->curr->brightness);
> +	mod_timer(&data->timer, jiffies + msecs_to_jiffies(data->curr->delta_t));
> +	pattern_trig_update_patterns(data);
> +
> +	mutex_unlock(&data->lock);
> +}
> +
> +static int pattern_trig_start_pattern(struct led_classdev *led_cdev)
> +{
> +	struct pattern_trig_data *data = led_cdev->trigger_data;
> +
> +	if (!data->npatterns)
> +		return 0;
> +
> +	if (data->is_hw_pattern) {
> +		return led_cdev->pattern_set(led_cdev, data->patterns,
> +					     data->npatterns, data->repeat);
> +	}

I have doubts here if it is a good idea to enforce array of tuples
as a generic interface for all hw_patterns. It may not fit well for
every hw pattern engine. It seems that the only feasible solution will
be allowing drivers to come up with their own interfaces, i.e. the
approach you proposed at first for your driver. It seems that the
ledtrig-pattern with software pattern mechanism will be just
a nice side effect of this series :-)

Unless someone will propose a better solution.

We need a broader consensus here. I'd like to hear Pavel's opinion,
since he's been always in favor of common pattern interface, and
inspired this work.

Pavel?

Best regards,
Jacek Anaszewski
