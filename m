From: Matt Ranostay <matt@ranostay.consulting>
Subject: Re: [PATCH v4] leds: pca963x: enable low-power state
Date: Fri, 28 Oct 2016 00:20:33 -0700
Message-ID: <CAJ_EiSRbMzbOty+vUnCf=trBwa0oxx74VC174Qd9DopnOtPEMg@mail.gmail.com>
References: <1477623195-32091-1-git-send-email-matt@ranostay.consulting> <CAPybu_1atgUh_Jovc_6x-L4eSHkT2LAnDT_sUnwchvpVzMxyfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:33898 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756118AbcJ1HUe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Oct 2016 03:20:34 -0400
Received: by mail-qk0-f193.google.com with SMTP id o68so1276190qkf.1
        for <linux-leds@vger.kernel.org>; Fri, 28 Oct 2016 00:20:34 -0700 (PDT)
In-Reply-To: <CAPybu_1atgUh_Jovc_6x-L4eSHkT2LAnDT_sUnwchvpVzMxyfQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Matt Ranostay <mranostay@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <p.meerwald@bct-electronic.com>, Tony Lindgren <tony@atomide.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

On Fri, Oct 28, 2016 at 12:04 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi Matt
>
>
> Have you verified that led_set cannot be called in "parallel" ? There
> might be a race condition otherwise

You are correct I should be using mutex_lock(&pca963x->chip->mutex);

>
> On Fri, Oct 28, 2016 at 4:53 AM, Matt Ranostay <mranostay@gmail.com> wrote:
>>
>> +static int pca963x_power_state(struct pca963x_led *pca963x)
>
> What about:
>
> if (pca963x->led_cdev.brightness)
>   set_bit(pca963x->led_num, leds_on);
> else
>   clear_bit(pca963x->led_num, leds_on);
>
> if (!(*leds_on) != !cached_leds)
>   return i2c_smbus_write_byte_data(pca963x->chip->client,
>                                    PCA963X_MODE1, *leds_on ? 0: BIT(4));
>
> return 0
>
>
> I believe it is simpler, but it is just a matter of taste.

Don't really matter to which way we do it, but will wait for everyone's
input before spamming with v5 (with mutex fixes above)

>
>
> Regards!
