From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] leds: Delete obsolete Versatile driver
Date: Thu, 4 May 2017 14:23:39 +0200
Message-ID: <CACRpkdaHxKMb=FRKdfNixry3TNPJo_hjqbxBm-oq8NfrHbkuYA@mail.gmail.com>
References: <20170504120308.6738-1-linus.walleij@linaro.org> <20170504121402.GB32103@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:35203 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751330AbdEDMXl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 May 2017 08:23:41 -0400
Received: by mail-io0-f176.google.com with SMTP id f102so20137806ioi.2
        for <linux-leds@vger.kernel.org>; Thu, 04 May 2017 05:23:40 -0700 (PDT)
In-Reply-To: <20170504121402.GB32103@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Thu, May 4, 2017 at 2:14 PM, Pavel Machek <pavel@ucw.cz> wrote:

> On Thu 2017-05-04 14:03:08, Linus Walleij wrote:
>> All users of the Versatile LED driver are deleted and replaced
>> with the very generic leds-syscon. Delete the old driver.
>
> If someone has LEDS_VERSATILE selected, he'll be unhappy if we apply
> first.
>
> Are you sure no _users_ have LEDS_VERSATILE selected? Should we give
> them some kind of warning? (#warning, printk, ...?)

Since the driver cannot probe from device tree or ACPI, the device must
be created in a board file using the device name "versatile-leds" which is
what the driver matches against.

For them to use it they must have out-of-tree boardfiles, and we discourage
both out-of-tree code and boardfiles.

The last boardfiles using this were deleted in
commit 7484c727b636a838818e71f6d03114633b25aba2
"ARM: realview: delete the RealView board files".

All Versatile, Integrator and RealView boards (the only one using the
versatile LEDs), have been migrated to use leds-syscon.c.

Yours,
Linus Walleij
