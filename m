From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] leds: pwm: Allow changing the pinctrl state
Date: Fri, 17 Nov 2017 19:34:47 -0200
Message-ID: <CAOMZO5BVXEUM2_EbtqENcmFeL=9E+epBUZybS=iDHX5aO92Nqw@mail.gmail.com>
References: <1510929126-9813-1-git-send-email-festevam@gmail.com> <05a98e78-0773-7108-6d42-4c680002a7ad@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:42875 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755058AbdKQVet (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Nov 2017 16:34:49 -0500
Received: by mail-oi0-f41.google.com with SMTP id r128so2587702oig.9
        for <linux-leds@vger.kernel.org>; Fri, 17 Nov 2017 13:34:48 -0800 (PST)
In-Reply-To: <05a98e78-0773-7108-6d42-4c680002a7ad@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Russell King <linux@arm.linux.org.uk>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>

Hi Jacek,

On Fri, Nov 17, 2017 at 6:51 PM, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:

> On power down event brightness is set to 0 on each registered
> LED class device that set LED_CORE_SUSPENDRESUME flag (leds-pwm does).
>
> It may be the case that pwm subsystem (or underlaying bus used by
> particular controller) is suspended before LED subsystem, or the
> culprit is the generic LED subsystem workqueue in which brightness
> setting events are queued for drivers that use brightness_set_blocking
> op (leds-pwm case).

Thanks for your comments.

I realized that this issue can be fixed inside drivers/pwm/pwm-imx.c :

--- a/drivers/pwm/pwm-imx.c
+++ b/drivers/pwm/pwm-imx.c
@@ -35,6 +35,7 @@
 #define MX3_PWMSAR                     0x0C    /* PWM Sample Register */
 #define MX3_PWMPR                      0x10    /* PWM Period Register */
 #define MX3_PWMCR_PRESCALER(x)         ((((x) - 1) & 0xFFF) << 4)
+#define MX3_PWMCR_STOPEN               (1 << 25)
 #define MX3_PWMCR_DOZEEN               (1 << 24)
 #define MX3_PWMCR_WAITEN               (1 << 23)
 #define MX3_PWMCR_DBGEN                        (1 << 22)
@@ -209,7 +210,7 @@ static int imx_pwm_apply_v2(struct pwm_chip *chip,
struct pwm_device *pwm,
                writel(duty_cycles, imx->mmio_base + MX3_PWMSAR);
                writel(period_cycles, imx->mmio_base + MX3_PWMPR);

-               cr = MX3_PWMCR_PRESCALER(prescale) |
+               cr = MX3_PWMCR_PRESCALER(prescale) | MX3_PWMCR_STOPEN |
                     MX3_PWMCR_DOZEEN | MX3_PWMCR_WAITEN |
                     MX3_PWMCR_DBGEN | MX3_PWMCR_CLKSRC_IPG_HIGH |
                     MX3_PWMCR_EN;

Setting the STOPEN bit, which "keeps PWM functional while in stop
mode" does the trick.

Maybe I will convert this into an optional device tree property to
keep the original behavior.

Thanks
