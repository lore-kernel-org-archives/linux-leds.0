From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4 1/2] leds: add DT binding for BCM6328 LED controller
Date: Tue, 28 Apr 2015 10:18:55 +0200
Message-ID: <553F426F.3000507@samsung.com>
References: <1429895176-21818-1-git-send-email-noltari@gmail.com>
 <1430050517-8045-1-git-send-email-noltari@gmail.com>
 <1430050517-8045-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:16766 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932454AbbD1IS7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 04:18:59 -0400
In-reply-to: <1430050517-8045-2-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com

On 04/26/2015 02:15 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> This adds device tree binding documentation for the Broadcom BCM6328 =
LED controller.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>   v4: introduce changes suggested by Jacek
>   - Follow Documentation convention.
>   v3: introduce changes suggested by Jacek
>   - Revert compatible string to "brcm,bcm6328-leds".
>   - Improved description.
>   - Renamed normal LEDs to hardware controlled.
>   - Explain that LEDs are active high by default on active-low option=
al property.
>   - Properties are now grouped depending on the type of LED and optio=
nal requirement.
>   - Added more examples to explain hardware controlled LEDs and activ=
ity/link selection.
>   v2: Introduce changes suggested by Florian and Jonas.
>   - Change compatible string to "brcm,bcm6328-leds-ctrl".
>   - Make valid LEDs statement more strict.
>   - Remove compatible strings from LED subnodes.
>   - Clarify that LEDs are active high by default.
>   - Add a better description for brcm,link-signal-sources and brcm,ac=
tivity-signal-sources.
>
>   .../devicetree/bindings/leds/leds-bcm6328.txt      | 309 ++++++++++=
+++++++++++
>   1 file changed, 309 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6=
328.txt

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

--=20
Best Regards,
Jacek Anaszewski
