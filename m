From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 2/4] platform: x86: dell-smbios: Add a generic
 dell-smbios notifier chain
Date: Mon, 24 Oct 2016 15:31:05 +0200
Message-ID: <20161024133105.GC12154@pali>
References: <20161023194652.24335-1-hdegoede@redhat.com>
 <20161023194652.24335-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33335 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936517AbcJXNbI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Oct 2016 09:31:08 -0400
Content-Disposition: inline
In-Reply-To: <20161023194652.24335-2-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On Sunday 23 October 2016 21:46:50 Hans de Goede wrote:
> There are several cases where events handled in one of the dell-* drivers
> need to be propagated to another dell-* driver.
> 
> This commits add 3 generic functions:
> dell_smbios_register_notifier()
> dell_smbios_unregister_notifier()
> dell_smbios_call_notifier()
> 
> It currently only defines 1 action:
> dell_smbios_kbd_backlight_brightness_changed
> 
> Which is intended to propagate kbd_backlight_brightness_changed wmi
> events from dell-wmi to dell-laptop (which contains the actual kbd
> backlight driver).
> 
> This is only somewhat dell smbios related, both dell-wmi and dell-laptop
> use smbios functions and I do not want to put the notifier head in
> either driver, as that will make the 2 drivers depend on each other.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -This is a new patch in v2 of this patch-set
> ---
>  drivers/platform/x86/dell-smbios.c | 20 ++++++++++++++++++++
>  drivers/platform/x86/dell-smbios.h | 11 +++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index d2412ab..8b96bdf 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -105,6 +105,26 @@ struct calling_interface_token *dell_smbios_find_token(int tokenid)
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_find_token);
>  
> +static ATOMIC_NOTIFIER_HEAD(dell_smbios_chain_head);
> +
> +int dell_smbios_register_notifier(struct notifier_block *nb)
> +{
> +	return atomic_notifier_chain_register(&dell_smbios_chain_head, nb);
> +}
> +EXPORT_SYMBOL_GPL(dell_smbios_register_notifier);
> +
> +int dell_smbios_unregister_notifier(struct notifier_block *nb)
> +{
> +	return atomic_notifier_chain_unregister(&dell_smbios_chain_head, nb);
> +}
> +EXPORT_SYMBOL_GPL(dell_smbios_unregister_notifier);
> +
> +void dell_smbios_call_notifier(unsigned long action, void *data)
> +{
> +	atomic_notifier_call_chain(&dell_smbios_chain_head, action, data);
> +}
> +EXPORT_SYMBOL_GPL(dell_smbios_call_notifier);
> +
>  static void __init parse_da_table(const struct dmi_header *dm)
>  {
>  	/* Final token is a terminator, so we don't want to copy it */
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
> index ec7d40a..e91f13f 100644
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
> +enum dell_smbios_notifier_actions {
> +	dell_smbios_kbd_backlight_brightness_changed,
> +};
> +
> +int dell_smbios_register_notifier(struct notifier_block *nb);
> +int dell_smbios_unregister_notifier(struct notifier_block *nb);
> +void dell_smbios_call_notifier(unsigned long action, void *data);
> +
>  #endif

That is better but technically speaking those notifiers do not have
nothing common with dell-smbios :-( Driver dell-smbios.ko provides API
for sending SMBIOS requests via SMM. Maybe move those functions into
separate module (and built statically into kernel)? Just speculation, do
not have something useful in my mind.

-- 
Pali Rohár
pali.rohar@gmail.com
