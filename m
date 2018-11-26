From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] leds: trigger: Introduce audio
 mute LED trigger
Date: Mon, 26 Nov 2018 21:59:24 +0100
Message-ID: <830616a9-ed5a-a098-5ab2-88ad5a04f1ea@gmail.com>
References: <20181126171126.20280-1-tiwai@suse.de>
 <20181126171126.20280-2-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20181126171126.20280-2-tiwai-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: Ayman Bagabas <ayman.bagabas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hui Wang <hui.wang-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Takashi,

Thank you for the patch set.

On 11/26/2018 06:11 PM, Takashi Iwai wrote:
> This patch adds a new LED trigger for coupling the audio mixer change
> with the LED on laptops or other devices.  Currently there are two
> trigger types, "audio-mute" and "audio-micmute".
> 
> The audio driver triggers the LED brightness change via
> ledtrig_audio_set() call with the proper type (either mute or
> mic-mute).  OTOH, the consumers may call ledtrig_audio_get() for the
> initial brightness value that may have been set by the audio driver
> beforehand.
> 
> This new stuff will be used by HD-audio codec driver and some platform
> drivers (thinkpad_acpi and dell-laptop, also upcoming huawei-wmi).
> 
> Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
> ---
>  drivers/leds/trigger/Kconfig         |  7 +++++
>  drivers/leds/trigger/Makefile        |  1 +
>  drivers/leds/trigger/ledtrig-audio.c | 45 ++++++++++++++++++++++++++++
>  include/linux/leds.h                 | 20 +++++++++++++
>  4 files changed, 73 insertions(+)
>  create mode 100644 drivers/leds/trigger/ledtrig-audio.c
> 
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index b76fc3cdc8f8..23cc85e2e0e5 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -136,4 +136,11 @@ config LEDS_TRIGGER_PATTERN
>  	  which is a series of tuples, of brightness and duration (ms).
>  	  If unsure, say N
>  
> +config LEDS_TRIGGER_AUDIO
> +	tristate "Audio Mute LED Trigger"
> +	help
> +	  This allows LEDs to be controlled by audio drivers for following
> +	  the audio mute and mic-mute changes.
> +	  If unsure, say N
> +
>  endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> index 9bcb64ee8123..733a83e2a718 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -14,3 +14,4 @@ obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+= ledtrig-camera.o
>  obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
>  obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
>  obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
> +obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
> diff --git a/drivers/leds/trigger/ledtrig-audio.c b/drivers/leds/trigger/ledtrig-audio.c
> new file mode 100644
> index 000000000000..cf2b6837f570
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-audio.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Audio Mute LED trigger
> +//
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/leds.h>
> +
> +static struct led_trigger *ledtrig_audio[NUM_AUDIO_LEDS];
> +static enum led_brightness audio_state[NUM_AUDIO_LEDS];
> +
> +enum led_brightness ledtrig_audio_get(enum led_audio type)
> +{
> +	return audio_state[type];
> +}
> +EXPORT_SYMBOL_GPL(ledtrig_audio_get);
> +
> +void ledtrig_audio_set(enum led_audio type, enum led_brightness state)
> +{
> +	audio_state[type] = state;
> +	led_trigger_event(ledtrig_audio[type], state);
> +}
> +EXPORT_SYMBOL_GPL(ledtrig_audio_set);
> +
> +static int __init ledtrig_audio_init(void)
> +{
> +	led_trigger_register_simple("audio-mute",
> +				    &ledtrig_audio[LED_AUDIO_MUTE]);
> +	led_trigger_register_simple("audio-micmute",
> +				    &ledtrig_audio[LED_AUDIO_MICMUTE]);
> +	return 0;
> +}
> +module_init(ledtrig_audio_init);
> +
> +static void __exit ledtrig_audio_exit(void)
> +{
> +	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_MUTE]);
> +	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_MICMUTE]);
> +}
> +module_exit(ledtrig_audio_exit);
> +
> +MODULE_DESCRIPTION("LED trigger for audio mute control");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 7393a316d9fa..580cbaef789a 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -487,4 +487,24 @@ struct led_pattern {
>  	int brightness;
>  };
>  
> +enum led_audio {
> +	LED_AUDIO_MUTE,		/* master mute LED */
> +	LED_AUDIO_MICMUTE,	/* mic mute LED */
> +	NUM_AUDIO_LEDS
> +};
> +
> +#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
> +enum led_brightness ledtrig_audio_get(enum led_audio type);
> +void ledtrig_audio_set(enum led_audio type, enum led_brightness state);
> +#else
> +static inline enum led_brightness ledtrig_audio_get(enum led_audio type)
> +{
> +	return LED_OFF;
> +}
> +static inline void ledtrig_audio_set(enum led_audio type,
> +				     enum led_brightness state)
> +{
> +}
> +#endif
> +
>  #endif		/* __LINUX_LEDS_H_INCLUDED */
> 

For this patch and FWIW for the whole patch set:

Acked-by: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-- 
Best regards,
Jacek Anaszewski
