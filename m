From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] leds: pca955x: add GPIO support
Date: Tue, 23 May 2017 12:58:42 +0200
Message-ID: <0df463c3-c08d-5f5d-0932-cba20ab870d5@kaod.org>
References: <1494311772-21872-1-git-send-email-clg@kaod.org>
 <20b94199-a154-53cd-96d1-910ae3de1085@gmail.com>
 <CACRpkdYRv-ASan1ZJevWbk=+_01LU0a8DDRL_nvhC59o25c5wA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 11.mo3.mail-out.ovh.net ([87.98.184.158]:47999 "EHLO
        11.mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934395AbdEWMOX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 May 2017 08:14:23 -0400
Received: from player771.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo3.mail-out.ovh.net (Postfix) with ESMTP id 11ADDD3E75
        for <linux-leds@vger.kernel.org>; Tue, 23 May 2017 12:58:54 +0200 (CEST)
In-Reply-To: <CACRpkdYRv-ASan1ZJevWbk=+_01LU0a8DDRL_nvhC59o25c5wA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Joel Stanley <joel@jms.id.au>

On 05/23/2017 10:18 AM, Linus Walleij wrote:
> On Thu, May 11, 2017 at 10:23 PM, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
> 
>>> +Optional properties:
>>> +- gpio-controller: allows pins to be used as GPIOs.
> 
> Are these output-only? Then write something about that.

no. input is also supported.

>>> +- #gpio-cells: if present, must not be 0.
> 
> Must be present and must be <2>
> 
>>> +- gpio-base : base number of the pins used as GPIOs. If there are more
>>> +              than one, they should be contiguous. See 'type' property
>>> +              below.
> 
> NACK. Not in my life.

yes, indeed. this is useless. 
 
> Provide -1 in the Linux driver and use the ioctl() from userspace
> to look up your gpios. Add .names array to the gpiochip if necessary,
> define line names in the device tree for the board.
> 
> Consult tools/gpio/* for the modern way of using GPIOs.

OK. I wasn't aware of these.

Thanks,

C. 
