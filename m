From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] Add LED / GPIO support for the PC Engines APU2.
Date: Sun, 30 Oct 2016 13:06:23 +0100
Message-ID: <a0b21db6-aa1b-bcda-ff33-94ce7b3a8c46@gmail.com>
References: <e8fbcb33-bf50-9118-8943-c3f3d0833da3@crc.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33075 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754592AbcJ3MHC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Oct 2016 08:07:02 -0400
Received: by mail-wm0-f67.google.com with SMTP id m83so14362027wmc.0
        for <linux-leds@vger.kernel.org>; Sun, 30 Oct 2016 05:07:02 -0700 (PDT)
In-Reply-To: <e8fbcb33-bf50-9118-8943-c3f3d0833da3@crc.id.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Steven Haigh <netwiz@crc.id.au>, linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hi Steven,

Thanks for the patches. Few initial notes:

- generally it is preferred to submit patches with "git send-email",
   which simplifies review, as the remarks can be added directly in the
   code, in a reply to the patch,
- if you want do add some overall description of the patch set then you
   can add --cover-letter switch which will generate template for this
   purpose.
- please also use scripts/checkpatch.pl before submission
- make sure that the patches are based on the master branch of
   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git,
- always add on CC the maintainers of the affected kernel subsystems -
   this information can be found in the MAINTAINERS file
- in case of LED drivers cc also linux-kernel@vger.kernel.org,
- subscribe to the mailing list related to the subsystem the patches
   are dedicated to, and skim through some recent patches and reviews -
   it can allow for eliminating some common problems from your driver
   and reducing the number of review iterations.

Regarding the patches - gpio-nct5104d.c seems to be targeted for
GPIO subsystem - you should add Linus Walleij and
linux-gpio@vger.kernel.org on cc.

For leds-apu2.c - you shouldn't register gpio driver in the LED
subsystem but add the relevant dependency in the Kconfig. Nonetheless
I can't find gpio-apu2.c driver in the mainline kernel.

You should also use devm_led_classdev_register() for registering LED
class device. Please follow the design of the other LED class drivers
using platform_device_register_simple() for probing.

Best regards,
Jacek Anaszewski

On 10/29/2016 06:38 PM, Steven Haigh wrote:
> Patches attached.
>
> Changes:
> * Updated leds_apu driver. Included an older version in my previous email.
> * Added required nct5104d GPIO driver support.
>
> These are all against 4.4.28 right now - but should probably apply
> cleanly to any future builds with minimal (or nil) changes.
>
> Please include me in the reply as I'm not part of this list.
>
