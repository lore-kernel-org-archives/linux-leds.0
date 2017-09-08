From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2] leds: pca955x: Don't invert requested value in pca955x_gpio_set_value()
Date: Fri, 8 Sep 2017 15:23:11 +0930
Message-ID: <CACPK8XeoZknwJ8VqSgvbzgWVBgCxiB2GB6n--LXEUVDodND6DQ@mail.gmail.com>
References: <20170901053858.10070-1-andrew@aj.id.au> <f07313a1-c609-f760-9578-4d6889fd89d9@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:37695 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752762AbdIHFxe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Sep 2017 01:53:34 -0400
In-Reply-To: <f07313a1-c609-f760-9578-4d6889fd89d9@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, Brandon Wyman <bjwyman@gmail.com>

On Sat, Sep 2, 2017 at 2:36 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 09/01/2017 07:38 AM, Andrew Jeffery wrote:

>> Rework leds-pca955x so that we avoid the incorrect inversion and clarify
>> the semantics with respect to GPIO.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

I gave this a spin on our 'witherspoon' system and the LEDs responded
as expected.

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
