From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 2/2] leds: add BCM6358 LED driver
Date: Fri, 22 May 2015 17:10:21 +0200
Message-ID: <555F46DD.5000005@samsung.com>
References: <1432055578-14089-1-git-send-email-noltari@gmail.com>
 <1432228270-21891-1-git-send-email-noltari@gmail.com>
 <1432228270-21891-3-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12680 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756233AbbEVPK0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 May 2015 11:10:26 -0400
In-reply-to: <1432228270-21891-3-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com

Hi Alvaro,

Thanks for the update.

On 05/21/2015 07:11 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> This adds support for the LED controller on Broadcom's BCM6358.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>   v2: introduce changes suggested by Jacek
>   - Use correct device_node when getting brcm,clk-div property.
>   - Code style fixes suggested by "checkpatch --strict".
>
>   drivers/leds/Kconfig        |   8 ++
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-bcm6358.c | 243 +++++++++++++++++++++++++++++++++=
+++++++++++
>   3 files changed, 252 insertions(+)
>   create mode 100644 drivers/leds/leds-bcm6358.c

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

--=20
Best Regards,
Jacek Anaszewski
