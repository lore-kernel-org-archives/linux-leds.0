From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v4] leds: pca963x: enable low-power state
Date: Fri, 28 Oct 2016 09:04:42 +0200
Message-ID: <CAPybu_1atgUh_Jovc_6x-L4eSHkT2LAnDT_sUnwchvpVzMxyfQ@mail.gmail.com>
References: <1477623195-32091-1-git-send-email-matt@ranostay.consulting>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36395 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965092AbcJ1HFE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Oct 2016 03:05:04 -0400
Received: by mail-wm0-f51.google.com with SMTP id b80so77917093wme.1
        for <linux-leds@vger.kernel.org>; Fri, 28 Oct 2016 00:05:04 -0700 (PDT)
In-Reply-To: <1477623195-32091-1-git-send-email-matt@ranostay.consulting>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Matt Ranostay <mranostay@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Matt Ranostay <matt@ranostay.consulting>, Peter Meerwald <p.meerwald@bct-electronic.com>, Tony Lindgren <tony@atomide.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

Hi Matt


Have you verified that led_set cannot be called in "parallel" ? There
might be a race condition otherwise

On Fri, Oct 28, 2016 at 4:53 AM, Matt Ranostay <mranostay@gmail.com> wrote:
>
> +static int pca963x_power_state(struct pca963x_led *pca963x)

What about:

if (pca963x->led_cdev.brightness)
  set_bit(pca963x->led_num, leds_on);
else
  clear_bit(pca963x->led_num, leds_on);

if (!(*leds_on) != !cached_leds)
  return i2c_smbus_write_byte_data(pca963x->chip->client,
                                   PCA963X_MODE1, *leds_on ? 0: BIT(4));

return 0


I believe it is simpler, but it is just a matter of taste.


Regards!
