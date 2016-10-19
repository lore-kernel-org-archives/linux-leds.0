From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 2/2] platform: x86: dell-*: Call
 led_notify_brightness_change on kbd brightness change
Date: Wed, 19 Oct 2016 16:06:14 +0200
Message-ID: <20161019140614.GF1689@pali>
References: <20161019133355.6192-1-hdegoede@redhat.com>
 <20161019133355.6192-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161019133355.6192-3-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wednesday 19 October 2016 15:33:55 Hans de Goede wrote:
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index d2412ab..7934953 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -21,6 +21,7 @@
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
>  #include <linux/io.h>
> +#include <linux/leds.h>
>  #include "../../firmware/dcdbas.h"
>  #include "dell-smbios.h"
>  
> @@ -40,6 +41,9 @@ static int da_command_code;
>  static int da_num_tokens;
>  static struct calling_interface_token *da_tokens;
>  
> +struct led_classdev *dell_kbd_backlight_led;
> +EXPORT_SYMBOL_GPL(dell_kbd_backlight_led);
> +
>  int dell_smbios_error(int value)
>  {
>  	switch (value) {

This is ugly! dell-smbios.c file have nothing to do with led and
keyboard backlight. It is generic interface for sending and receiving
smbios requests.

I know, there are "layering problems" and something better should be
invented. Drivers dell-wmi.ko and dell-rbtn.ko provides events and
dell-laptop.ko want to listen for them. There is already hack in
dell-rbnt.ko which I really would like to fix and then delete...

So I rather do not want to see another hacks in that code.

-- 
Pali Rohár
pali.rohar@gmail.com
