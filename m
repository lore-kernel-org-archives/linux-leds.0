From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 6+/6] platform/x86: dell-wmi-led: fix coding style
 issues
Date: Tue, 17 Jan 2017 12:08:31 +0100
Message-ID: <20170117110831.GD26116@xo-6d-61-c0.localdomain>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170117071714.21594-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38166 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750962AbdAQLJV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Jan 2017 06:09:21 -0500
Content-Disposition: inline
In-Reply-To: <20170117071714.21594-1-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

On Tue 2017-01-17 08:17:14, Michał Kępień wrote:
> Fix coding style issues in dell-wmi-led which checkpatch complains about
> to make sure the module gets a clean start in the x86 platform driver
> subsystem.
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>

Acked-by: Pavel Machek <pavel@ucw.cz>

> ---
> This is an extra patch that Jacek asked for [1].
> 
> [1] https://lkml.org/lkml/2017/1/16/631
> 
>  drivers/platform/x86/dell-wmi-led.c | 41 +++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi-led.c b/drivers/platform/x86/dell-wmi-led.c
> index d0232c7f1909..8753c4fc36b8 100644
> --- a/drivers/platform/x86/dell-wmi-led.c
> +++ b/drivers/platform/x86/dell-wmi-led.c
> @@ -46,21 +46,16 @@ struct bios_args {
>  	unsigned char off_time;
>  };
>  
> -static int dell_led_perform_fn(u8 length,
> -		u8 result_code,
> -		u8 device_id,
> -		u8 command,
> -		u8 on_time,
> -		u8 off_time)
> +static int dell_led_perform_fn(u8 length, u8 result_code, u8 device_id,
> +			       u8 command, u8 on_time, u8 off_time)
>  {
> -	struct bios_args *bios_return;
> -	u8 return_code;
> -	union acpi_object *obj;
>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct bios_args *bios_return, args;
>  	struct acpi_buffer input;
> +	union acpi_object *obj;
>  	acpi_status status;
> +	u8 return_code;
>  
> -	struct bios_args args;
>  	args.length = length;
>  	args.result_code = result_code;
>  	args.device_id = device_id;
> @@ -71,11 +66,7 @@ static int dell_led_perform_fn(u8 length,
>  	input.length = sizeof(struct bios_args);
>  	input.pointer = &args;
>  
> -	status = wmi_evaluate_method(DELL_LED_BIOS_GUID,
> -		1,
> -		1,
> -		&input,
> -		&output);
> +	status = wmi_evaluate_method(DELL_LED_BIOS_GUID, 1, 1, &input, &output);
>  
>  	if (ACPI_FAILURE(status))
>  		return status;
> @@ -84,7 +75,7 @@ static int dell_led_perform_fn(u8 length,
>  
>  	if (!obj)
>  		return -EINVAL;
> -	else if (obj->type != ACPI_TYPE_BUFFER) {
> +	if (obj->type != ACPI_TYPE_BUFFER) {
>  		kfree(obj);
>  		return -EINVAL;
>  	}
> @@ -117,8 +108,7 @@ static int led_off(void)
>  		0);			/* not used */
>  }
>  
> -static int led_blink(unsigned char on_eighths,
> -		unsigned char off_eighths)
> +static int led_blink(unsigned char on_eighths, unsigned char off_eighths)
>  {
>  	return dell_led_perform_fn(5,	/* Length of command */
>  		INTERFACE_ERROR,	/* Init to  INTERFACE_ERROR */
> @@ -129,7 +119,7 @@ static int led_blink(unsigned char on_eighths,
>  }
>  
>  static void dell_led_set(struct led_classdev *led_cdev,
> -		enum led_brightness value)
> +			 enum led_brightness value)
>  {
>  	if (value == LED_OFF)
>  		led_off();
> @@ -138,24 +128,25 @@ static void dell_led_set(struct led_classdev *led_cdev,
>  }
>  
>  static int dell_led_blink(struct led_classdev *led_cdev,
> -		unsigned long *delay_on,
> -		unsigned long *delay_off)
> +			  unsigned long *delay_on, unsigned long *delay_off)
>  {
>  	unsigned long on_eighths;
>  	unsigned long off_eighths;
>  
> -	/* The Dell LED delay is based on 125ms intervals.
> -	   Need to round up to next interval. */
> +	/*
> +	 * The Dell LED delay is based on 125ms intervals.
> +	 * Need to round up to next interval.
> +	 */
>  
>  	on_eighths = (*delay_on + 124) / 125;
> -	if (0 == on_eighths)
> +	if (on_eighths == 0)
>  		on_eighths = 1;
>  	if (on_eighths > 255)
>  		on_eighths = 255;
>  	*delay_on = on_eighths * 125;
>  
>  	off_eighths = (*delay_off + 124) / 125;
> -	if (0 == off_eighths)
> +	if (off_eighths == 0)
>  		off_eighths = 1;
>  	if (off_eighths > 255)
>  		off_eighths = 255;
> -- 
> 2.11.0

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
