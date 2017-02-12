From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds/trigger/cpu: Add LED trigger for all CPUs
 aggregated
Date: Sun, 12 Feb 2017 21:45:12 +0100
Message-ID: <08915299-4fa2-772b-ea92-cc7f5b9f6646@gmail.com>
References: <20170209230735.27007-1-me@paulo.costa.nom.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33167 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750999AbdBLUqB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Feb 2017 15:46:01 -0500
Received: by mail-wm0-f65.google.com with SMTP id v77so15881378wmv.0
        for <linux-leds@vger.kernel.org>; Sun, 12 Feb 2017 12:46:00 -0800 (PST)
In-Reply-To: <20170209230735.27007-1-me@paulo.costa.nom.br>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Paulo Costa <me@paulo.costa.nom.br>, linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>

Hi Paulo,

Thanks for the patch,
Pavel - thanks for the review.

Patch applied to the for-4.12 branch of linux-leds.git.

Best regards,
Jacek Anaszewski

On 02/10/2017 12:07 AM, Paulo Costa wrote:
> Currently there is one CPU led trigger per cpu ('cpu0', 'cpu1', ...)
> 
> This patch adds a new trigger, 'cpu', with brightness proportional to
> the number of active CPUs.
> 
> If multiple brightness levels aren't supported on the LED,
> it effectively indicates if there is any CPU active.
> 
> This is particularly useful on tiny linux boards with more CPU cores than LED pins.
> 
> Signed-off-by: Paulo Costa <me@paulo.costa.nom.br>
> CC: Pavel Machek <pavel@ucw.cz>
> ---
> v2:
> * Fix concurrency issues during initialization
> * Round up the division
> ---
>  drivers/leds/trigger/ledtrig-cpu.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
> index 22f0634..06ec733 100644
> --- a/drivers/leds/trigger/ledtrig-cpu.c
> +++ b/drivers/leds/trigger/ledtrig-cpu.c
> @@ -31,12 +31,16 @@
>  #define MAX_NAME_LEN	8
>  
>  struct led_trigger_cpu {
> +	bool is_active;
>  	char name[MAX_NAME_LEN];
>  	struct led_trigger *_trig;
>  };
>  
>  static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
>  
> +static struct led_trigger *trig_cpu_all;
> +static atomic_t num_active_cpus = ATOMIC_INIT(0);
> +
>  /**
>   * ledtrig_cpu - emit a CPU event as a trigger
>   * @evt: CPU event to be emitted
> @@ -47,26 +51,46 @@ static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
>  void ledtrig_cpu(enum cpu_led_event ledevt)
>  {
>  	struct led_trigger_cpu *trig = this_cpu_ptr(&cpu_trig);
> +	bool is_active = trig->is_active;
>  
>  	/* Locate the correct CPU LED */
>  	switch (ledevt) {
>  	case CPU_LED_IDLE_END:
>  	case CPU_LED_START:
>  		/* Will turn the LED on, max brightness */
> -		led_trigger_event(trig->_trig, LED_FULL);
> +		is_active = true;
>  		break;
>  
>  	case CPU_LED_IDLE_START:
>  	case CPU_LED_STOP:
>  	case CPU_LED_HALTED:
>  		/* Will turn the LED off */
> -		led_trigger_event(trig->_trig, LED_OFF);
> +		is_active = false;
>  		break;
>  
>  	default:
>  		/* Will leave the LED as it is */
>  		break;
>  	}
> +
> +	if (is_active != trig->is_active) {
> +		unsigned int active_cpus;
> +		unsigned int total_cpus;
> +
> +		/* Update trigger state */
> +		trig->is_active = is_active;
> +		atomic_add(is_active ? 1 : -1, &num_active_cpus);
> +		active_cpus = atomic_read(&num_active_cpus);
> +		total_cpus = num_present_cpus();
> +
> +		led_trigger_event(trig->_trig,
> +			is_active ? LED_FULL : LED_OFF);
> +
> +
> +		led_trigger_event(trig_cpu_all,
> +			DIV_ROUND_UP(LED_FULL * active_cpus, total_cpus));
> +
> +	}
>  }
>  EXPORT_SYMBOL(ledtrig_cpu);
>  
> @@ -113,6 +137,11 @@ static int __init ledtrig_cpu_init(void)
>  	BUILD_BUG_ON(CONFIG_NR_CPUS > 9999);
>  
>  	/*
> +	 * Registering a trigger for all CPUs.
> +	 */
> +	led_trigger_register_simple("cpu", &trig_cpu_all);
> +
> +	/*
>  	 * Registering CPU led trigger for each CPU core here
>  	 * ignores CPU hotplug, but after this CPU hotplug works
>  	 * fine with this trigger.
> 
