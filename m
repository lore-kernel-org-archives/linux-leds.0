From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/3] leds: leds-gpio: Add missing #include <linux/of.h>
Date: Tue, 12 May 2015 10:49:46 -0700
Message-ID: <CAK5ve-+rsWrQZhoGu0qxY7E5WFMNwk3THyBNbMZubz8Qg611Vw@mail.gmail.com>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
 <1430986090-7243-3-git-send-email-geert@linux-m68k.org> <554B5749.60801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:35384 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933010AbbELRuI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 13:50:08 -0400
In-Reply-To: <554B5749.60801@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Thu, May 7, 2015 at 5:15 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 05/07/2015 10:08 AM, Geert Uytterhoeven wrote:
>>
>> drivers/leds/leds-gpio.c: In function =E2=80=98gpio_leds_create=E2=80=
=99:
>> drivers/leds/leds-gpio.c:194: error: implicit declaration of functio=
n
>> =E2=80=98of_node=E2=80=99
>> drivers/leds/leds-gpio.c:194: warning: assignment makes pointer from
>> integer without a cast
>> drivers/leds/leds-gpio.c:200: error: dereferencing pointer to incomp=
lete
>> type
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>   drivers/leds/leds-gpio.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
>> index 15eb3f86f670ffe4..89d981e8f8cacf55 100644
>> --- a/drivers/leds/leds-gpio.c
>> +++ b/drivers/leds/leds-gpio.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/leds.h>
>>   #include <linux/module.h>
>> +#include <linux/of.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/property.h>
>>   #include <linux/slab.h>
>>
>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>

Merged, thanks.
-Bryan
