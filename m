From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 3/4] platform: x86: dell-*: Call
 led_notify_brightness_change on kbd brightness change
Date: Mon, 24 Oct 2016 15:34:59 +0200
Message-ID: <20161024133459.GD12154@pali>
References: <20161023194652.24335-1-hdegoede@redhat.com>
 <20161023194652.24335-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161023194652.24335-3-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sunday 23 October 2016 21:46:51 Hans de Goede wrote:
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index da2fe18..f86e774 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -319,6 +319,11 @@ static void dell_wmi_process_key(int type, int code)
>  	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
>  		return;
>  
> +	if (type == 0x0011 && (code == 0x01e1 || code == 0x02ea ||
> +			 code == 0x02eb || code == 0x02ec || code == 0x02f6))
> +		dell_smbios_call_notifier(
> +			dell_smbios_kbd_backlight_brightness_changed, NULL);
> +
>  	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
>  }
>  

This part of patch is ugly. Some random numbers are checked and then
notifier is called. We already have big table with explanation of those
events... It is not possible to extend it with some flag or somehow
other that value should be called via notifier?

Btw, personally I would use uppercase DELL_SMBIOS_KBD_... name from that
enum, but I do not know what is correct coding style here for kernel.

-- 
Pali Rohár
pali.rohar@gmail.com
