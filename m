From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v8 4/7] platform/x86/dell-*: Add a generic dell-laptop
 notifier chain
Date: Tue, 21 Feb 2017 15:18:02 +0100
Message-ID: <20170221141802.GH9795@pali>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-5-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170209154417.19040-5-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thursday 09 February 2017 16:44:14 Hans de Goede wrote:
> There are several cases where events handled in one of the dell-* drivers
> need to be propagated to another dell-* driver.
> 
> This commits add 3 generic functions:
> dell_laptop_register_notifier()
> dell_laptop_unregister_notifier()
> dell_laptop_call_notifier()
> 
> It currently only defines 1 action:
> DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED
> 
> Which is intended to propagate kbd_backlight_brightness_changed wmi
> events from dell-wmi to dell-laptop (which contains the actual kbd
> backlight driver).
> 
> These functions are put in dell-smbios as both dell-wmi and dell-laptop
> use smbios functions and I do not want to put the notifier head in
> either driver, as that will make the 2 drivers depend on each other.

As wrote in previous emails I do not like adding some totally
SMBIOS-unrelated functions to SMBIOS driver. Basically dell-smbios.ko is
driver for sending smbios calls and this new laptop notifier is for
sending events between other dell drivers.

But I remember that we have not find any clean or better solution yet.

So I will let this patch open for other people...

If somebody has better idea how to solve this problem let us know.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -This is a new patch in v2 of this patch-set
> Changes in v3:
> -No changes
> Changes in v4:
> -Rename functions from dell_smbios_*_notifier to dell_laptop_*_notifier
> Changes in v5:
> -Dropped due to new led-trigger based approach making this unnecessary
> Changes in v6:
> -Re-introduced as led-trigger based approach got nacked
> Changes in v8:
> -Change from atomic to blocking notifier as some of the called notifier
>  callbacks may take a mutex
> ---
>  drivers/platform/x86/dell-smbios.c | 20 ++++++++++++++++++++
>  drivers/platform/x86/dell-smbios.h | 11 +++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index d2412ab..0a57234 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -105,6 +105,26 @@ struct calling_interface_token *dell_smbios_find_token(int tokenid)
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_find_token);
>  
> +static BLOCKING_NOTIFIER_HEAD(dell_laptop_chain_head);
> +
> +int dell_laptop_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&dell_laptop_chain_head, nb);
> +}
> +EXPORT_SYMBOL_GPL(dell_laptop_register_notifier);
> +
> +int dell_laptop_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&dell_laptop_chain_head, nb);
> +}
> +EXPORT_SYMBOL_GPL(dell_laptop_unregister_notifier);
> +
> +void dell_laptop_call_notifier(unsigned long action, void *data)
> +{
> +	blocking_notifier_call_chain(&dell_laptop_chain_head, action, data);
> +}
> +EXPORT_SYMBOL_GPL(dell_laptop_call_notifier);
> +
>  static void __init parse_da_table(const struct dmi_header *dm)
>  {
>  	/* Final token is a terminator, so we don't want to copy it */
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
> index ec7d40a..45cbc22 100644
> --- a/drivers/platform/x86/dell-smbios.h
> +++ b/drivers/platform/x86/dell-smbios.h
> @@ -16,6 +16,8 @@
>  #ifndef _DELL_SMBIOS_H_
>  #define _DELL_SMBIOS_H_
>  
> +struct notifier_block;
> +
>  /* This structure will be modified by the firmware when we enter
>   * system management mode, hence the volatiles */
>  
> @@ -43,4 +45,13 @@ void dell_smbios_release_buffer(void);
>  void dell_smbios_send_request(int class, int select);
>  
>  struct calling_interface_token *dell_smbios_find_token(int tokenid);
> +
> +enum dell_laptop_notifier_actions {
> +	DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED,
> +};
> +
> +int dell_laptop_register_notifier(struct notifier_block *nb);
> +int dell_laptop_unregister_notifier(struct notifier_block *nb);
> +void dell_laptop_call_notifier(unsigned long action, void *data);
> +
>  #endif

-- 
Pali Rohár
pali.rohar@gmail.com
