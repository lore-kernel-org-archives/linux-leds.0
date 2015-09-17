From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] LED/MIPS: Move SEAD3 LED driver to where it belongs.
Date: Thu, 17 Sep 2015 10:36:48 +0200
Message-ID: <55FA7BA0.4080706@samsung.com>
References: <20150803150401.GD2843@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11089 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753955AbbIQIgv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2015 04:36:51 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NUT00CV8BXDVN00@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 17 Sep 2015 09:36:49 +0100 (BST)
In-reply-to: <20150803150401.GD2843@linux-mips.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Markos Chandras <markos.chandras@imgtec.com>, linux-leds@vger.kernel.org, linux-mips@linux-mips.org

Hi Ralf,

This patch got stuck somewhere in my mailbox and just
recently showed up to my eyes again, so I applied it to v4.3-rc1, but 
when tried to compile-test it, I got following errors:

arch/mips/kernel/signal.c: In function 'sc_to_extcontext':
arch/mips/kernel/signal.c:143:12: error: 'struct ucontext' has no member 
named 'uc_extcontext'
   return &uc->uc_extcontext;
             ^
In file included from include/linux/poll.h:11:0,
                  from include/linux/ring_buffer.h:7,
                  from include/linux/trace_events.h:5,
                  from include/trace/syscall.h:6,
                  from include/linux/syscalls.h:81,
                  from arch/mips/kernel/signal.c:26:
arch/mips/kernel/signal.c: In function 'save_msa_extcontext':
arch/mips/kernel/signal.c:171:40: error: dereferencing pointer to 
incomplete type
    err = __put_user(read_msa_csr(), &msa->csr);
                                         ^
./arch/mips/include/asm/uaccess.h:441:15: note: in definition of macro 
'__put_user_nocheck'
   __typeof__(*(ptr)) __pu_val;     \
                ^
arch/mips/kernel/signal.c:171:9: note: in expansion of macro '__put_user'
    err = __put_user(read_msa_csr(), &msa->csr);
          ^
arch/mips/kernel/signal.c:171:40: error: dereferencing pointer to 
incomplete type
    err = __put_user(read_msa_csr(), &msa->csr);
                                         ^
./arch/mips/include/asm/uaccess.h:430:10: note: in definition of macro 
'__put_user_common'
   switch (size) {       \
           ^
./arch/mips/include/asm/uaccess.h:446:3: note: in expansion of macro 
'__put_kernel_common'
    __put_kernel_common(ptr, size);    \
    ^
./arch/mips/include/asm/uaccess.h:214:2: note: in expansion of macro 
'__put_user_nocheck'
   __put_user_nocheck((x), (ptr), sizeof(*(ptr)))
   ^
arch/mips/kernel/signal.c:171:9: note: in expansion of macro '__put_user'
    err = __put_user(read_msa_csr(), &msa->csr);
          ^
arch/mips/kernel/signal.c:171:40: error: dereferencing pointer to 
incomplete type
    err = __put_user(read_msa_csr(), &msa->csr);
                                         ^
./arch/mips/include/asm/uaccess.h:241:51: note: in definition of macro '__m'
  #define __m(x) (*(struct __large_struct __user *)(x))
                                                    ^
-- cut listing here - it is much longer --


Compilation succeeds with v4.2-rc8.
Is it a known issue?

-- 
Best Regards,
Jacek Anaszewski

On 08/03/2015 05:04 PM, Ralf Baechle wrote:
> Fixes the following randconfig problem
>
> leds-sead3.c:(.text+0x7dc): undefined reference to `led_classdev_unregister'
> leds-sead3.c:(.text+0x7e8): undefined reference to `led_classdev_unregister'
>
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Markos Chandras <markos.chandras@imgtec.com>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> ---
>   arch/mips/mti-sead3/Makefile                       |  2 --
>   drivers/leds/Kconfig                               | 10 ++++++++++
>   drivers/leds/Makefile                              |  1 +
>   {arch/mips/mti-sead3 => drivers/leds}/leds-sead3.c |  1 +
>   4 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/mti-sead3/Makefile b/arch/mips/mti-sead3/Makefile
> index 2e52cbd..7a584e0 100644
> --- a/arch/mips/mti-sead3/Makefile
> +++ b/arch/mips/mti-sead3/Makefile
> @@ -12,6 +12,4 @@ obj-y				:= sead3-lcd.o sead3-display.o sead3-init.o \
>   				   sead3-int.o sead3-platform.o sead3-reset.o \
>   				   sead3-setup.o sead3-time.o
>
> -obj-y				+= leds-sead3.o
> -
>   obj-$(CONFIG_EARLY_PRINTK)	+= sead3-console.o
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 9ad35f7..531729c 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -550,6 +550,16 @@ config LEDS_KTD2692
>
>   	  Say Y to enable this driver.
>
> +config LEDS_SEAD3
> +	tristate "LED support for the MIPS SEAD 3 board"
> +	depends on LEDS_CLASS && MIPS_SEAD3
> +	help
> +	  Say Y here to include support for the FLED and PLED LEDs on SEAD3 eval
> +	  boards.
> +
> +	  This driver can also be built as a module. If so the module
> +	  will be called leds-sead3.
> +
>   comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
>
>   config LEDS_BLINKM
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 8d6a24a..a976161 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -65,6 +65,7 @@ obj-$(CONFIG_LEDS_VERSATILE)		+= leds-versatile.o
>   obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
>   obj-$(CONFIG_LEDS_PM8941_WLED)		+= leds-pm8941-wled.o
>   obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
> +obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
>
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> diff --git a/arch/mips/mti-sead3/leds-sead3.c b/drivers/leds/leds-sead3.c
> similarity index 99%
> rename from arch/mips/mti-sead3/leds-sead3.c
> rename to drivers/leds/leds-sead3.c
> index c938cee..eb97a32 100644
> --- a/arch/mips/mti-sead3/leds-sead3.c
> +++ b/drivers/leds/leds-sead3.c
> @@ -59,6 +59,7 @@ static int sead3_led_remove(struct platform_device *pdev)
>   {
>   	led_classdev_unregister(&sead3_pled);
>   	led_classdev_unregister(&sead3_fled);
> +
>   	return 0;
>   }
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
