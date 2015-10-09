From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 0/4] leds-bcm6328: several fixes and improvements
Date: Fri, 09 Oct 2015 12:20:16 +0200
Message-ID: <561794E0.1050007@samsung.com>
References: <1444300555-13988-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34330 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753524AbbJIKUU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 9 Oct 2015 06:20:20 -0400
In-reply-to: <1444300555-13988-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, jogo@openwrt.org, cernekee@gmail.com, f.fainelli@gmail.com

Hi Alvaro,

Thanks for the patches, merged.

Best Regards,
Jacek Anaszewski

On 10/08/2015 12:35 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> These patches improve leds-bcm6328 by adding invalid LED printing (li=
ke it's done in leds-bcm6358), simplifying default-state handling (once=
 again like it's done in leds-bcm6358), and adding more init configurat=
ion options.
>
> =C3=81lvaro Fern=C3=A1ndez Rojas (4):
>    leds-bcm6328: print invalid LED
>    leds-bcm6328: simplify and improve default-state handling
>    leds-bcm6328: add more init configuration options
>    Documentation: leds: update DT bindings for leds-bcm6328
>
>   .../devicetree/bindings/leds/leds-bcm6328.txt      | 10 ++++++
>   drivers/leds/leds-bcm6328.c                        | 41 +++++++++++=
+++++------
>   2 files changed, 40 insertions(+), 11 deletions(-)
>
