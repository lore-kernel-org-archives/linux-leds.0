From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/8] leds: bcm6328/bcm6358: several fixes and
 improvements
Date: Wed, 16 Dec 2015 09:49:00 +0100
Message-ID: <5671257C.4000305@samsung.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1450209832-2742-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55619 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932927AbbLPItH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 16 Dec 2015 03:49:07 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZG00EC30HSLB30@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 16 Dec 2015 08:49:04 +0000 (GMT)
In-reply-to: <1450209832-2742-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-leds@vger.kernel.org, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu

Hi Alvaro,

Thanks for the update, patch set applied.

On 12/15/2015 09:03 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> These patches add several fixes and improvements for leds-bcm6328 and
> leds-bcm6358.
>
> v2: introduce changes suggested by Jacek and Florian
>   - change "leds-bcm6328:" to "leds: bcm6328:"
>   - change "leds-bcm6358:" to "leds: bcm6358:"
>   - add little endian support
>   - bcm6358: Merge bcm6358_led_mode into bcm6358_led_set
>
> =C3=81lvaro Fern=C3=A1ndez Rojas (8):
>    leds: bcm6328: code cleaning
>    leds: bcm6328: remove unneded lock when checking initial LED
>    leds: bcm6358: Use bcm6358_led_set() in order to get rid of the lo=
ck
>    leds: bcm6358: remove unneded lock when checking initial LED statu=
s
>    leds: bcm6328: add little endian support
>    leds: bcm6358: add little endian support
>    leds: bcm6328: simplify duplicated unlock in bcm6328_blink_set
>    leds: bcm6358: merge bcm6358_led_mode and bcm6358_led_set
>
>   drivers/leds/leds-bcm6328.c | 29 +++++++++++++++++------------
>   drivers/leds/leds-bcm6358.c | 34 ++++++++++++++++------------------
>   2 files changed, 33 insertions(+), 30 deletions(-)
>


--=20
Best Regards,
Jacek Anaszewski
