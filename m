From: Gadre Nayan <gadrenayan@gmail.com>
Subject: Re: gpio-led driver
Date: Thu, 21 Jul 2016 09:42:18 +0530
Message-ID: <CAKJ7aR6ga8b11tcQ9fPQUeW6kNYxNyz66f6+tmAFGzRr7=om+w@mail.gmail.com>
References: <CAEwN+MA=hFvqhBsuzo2XJWgqeO6h7L126Z+YRfOZxPmdn=afCw@mail.gmail.com>
 <7B4F09F2-45F9-4E6F-81A5-955E6B1B4980@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34389 "EHLO
	mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751199AbcGUEMT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jul 2016 00:12:19 -0400
Received: by mail-it0-f67.google.com with SMTP id u186so474729ita.1
        for <linux-leds@vger.kernel.org>; Wed, 20 Jul 2016 21:12:19 -0700 (PDT)
In-Reply-To: <7B4F09F2-45F9-4E6F-81A5-955E6B1B4980@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Anish Kumar <anish198519851985@gmail.com>
Cc: Raul Piper <raulpblooper@gmail.com>, linux-leds@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi,

OF stands for open firmware, OF uses a format to represent platform
information, which is called a device tree.

An example of how the driver extracts information from device  tree:

#if defined(CONFIG_OF)
static const struct of_device_id dali_of_ids[] =
{
       { .compatible = "arm,dali_gpio", },
       {},
};

MODULE_DEVICE_TABLE(of, dali_of_ids);
#endif

static struct platform_driver dali_driver = {
        .driver = {
                        .name = "dali_gpio",
                        .of_match_table = of_match_ptr(dali_of_ids),
        },
        .probe = Dali_probe,
        .remove = Dali_remove,
};

The driver is going to fetch information from the device tree later on
(in probe) using the compatible property mentioned. So if the tree has
the same compatible string then subsequent information can be obtained
from that device tree node.

Thanks
Nayan Gadre

On Wed, Jul 20, 2016 at 8:30 PM, Anish Kumar
<anish198519851985@gmail.com> wrote:
>
>
> On Jul 20, 2016, at 4:15 AM, Raul Piper <raulpblooper@gmail.com> wrote:
>
> Hi,
> I wanted to know the part number
>
>
> What is part number?
>
> for the leds-gpio.c in the driver/leds folder and the device tree bindings
> for this driver .Can some one point out to me where in Linux kernel it is?
>
> Also why below line has been used.Is it mandatory?
> ...
> .of_match_table = of_gpio_leds_match,
>
>
> This is needed when you are using device tree for getting the board settings
> but you can also do the same without this as well. Read up on device tree in
> kernel Documentation folder.
>
> },
>
> thanks in advance ,
> Rp
>
> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
>
>
> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
>
