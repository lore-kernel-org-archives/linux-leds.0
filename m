From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 6+/6] platform/x86: dell-wmi-led: fix coding style
 issues
Date: Tue, 17 Jan 2017 00:21:23 -0800
Message-ID: <1484641283.9538.5.camel@perches.com>
References: <20170116132204.6421-1-kernel@kempniu.pl>
         <20170117071714.21594-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170117071714.21594-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 2017-01-17 at 08:17 +0100, Michał Kępień wrote:
> Fix coding style issues in dell-wmi-led which checkpatch complains about
> to make sure the module gets a clean start in the x86 platform driver
> subsystem.

trivia:

> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
> This is an extra patch that Jacek asked for [1].
> 
> [1] https://lkml.org/lkml/2017/1/16/631
> 
>  drivers/platform/x86/dell-wmi-led.c | 41 +++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi-led.c b/drivers/platform/x86/dell-wmi-led.c
[]
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

This declaration might be nicer using

	struct bios_args args = {
		.length = length,
		.result_code = result_code,
		.device_id = device_id,
		[...]
	};

[]

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

These could use DIV_ROUND_UP and clamp()
