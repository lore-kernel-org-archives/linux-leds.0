From: "Simon Arlott" <simon@fire.lp0.eu>
Subject: Re: [PATCH] leds: bcm6328: Handle default-state of LEDs correctly
Date: Mon, 26 Oct 2015 12:36:20 -0000
Message-ID: <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
References: <562BB799.7000708@simon.arlott.org.uk>
    <562DE832.6070903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from proxima.lp0.eu ([81.2.80.65]:59600 "EHLO proxima.lp0.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753692AbbJZMgl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 26 Oct 2015 08:36:41 -0400
In-Reply-To: <562DE832.6070903@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?utf-8?B?IsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyI=?= <noltari@gmail.com>, Jonas Gorski <jogo@openwrt.org>

On Mon, October 26, 2015 08:45, Jacek Anaszewski wrote:
> Hi Simon,
>
> Thanks for the patch. There are conflicts when applying
> it to the LED tree:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
>
> Please use it as a code base for your LED development.

This has already been fixed in the devel branch by d19e6b6a0062c86a75365f0715fd079245f6aab9,
although I think bcm6328_led() should adjust its use of the spinlock
to only cover reading the register and call bcm6328_led_set() instead
of copying the code from it.

-- 
Simon Arlott
