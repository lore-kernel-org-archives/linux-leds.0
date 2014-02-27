From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/5] leds: leds-ss4200: remove DEFINE_PCI_DEVICE_TABLE macro
Date: Thu, 27 Feb 2014 10:01:19 -0800
Message-ID: <CAK5ve-LvnxV4D0RK7psjHHS2Tf8mR63cBNzsxdFDzKKLyr3SVg@mail.gmail.com>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com> <000c01cf32b1$1e1c8720$5a559560$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:50222 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030AbaB0SBk (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2014 13:01:40 -0500
Received: by mail-la0-f43.google.com with SMTP id e16so1695539lan.16
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2014 10:01:39 -0800 (PST)
In-Reply-To: <000c01cf32b1$1e1c8720$5a559560$%han@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Dave Hansen <dave@linux.vnet.ibm.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Tue, Feb 25, 2014 at 9:10 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> Don't use DEFINE_PCI_DEVICE_TABLE macro, because this macro
> is deprecated.
>

Applied, thanks,
-Bryan

> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/leds/leds-ss4200.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index 3faf550..7dd033d 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -63,7 +63,7 @@ MODULE_LICENSE("GPL");
>  /*
>   * PCI ID of the Intel ICH7 LPC Device within which the GPIO block lives.
>   */
> -static DEFINE_PCI_DEVICE_TABLE(ich7_lpc_pci_id) = {
> +static const struct pci_device_id ich7_lpc_pci_id[] = {
>         { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_0) },
>         { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_1) },
>         { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_30) },
> --
> 1.7.10.4
>
>
