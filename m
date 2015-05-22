From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2 2/2] leds: add BCM6358 LED driver
Date: Fri, 22 May 2015 15:34:56 -0700
Message-ID: <CAK5ve-KtmNnBKd5KZ8eErydVSvGqDMV9p_DX5_MbT=xxU=NHrA@mail.gmail.com>
References: <1432055578-14089-1-git-send-email-noltari@gmail.com>
 <1432228270-21891-1-git-send-email-noltari@gmail.com> <1432228270-21891-3-git-send-email-noltari@gmail.com>
 <555F46DD.5000005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:36821 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1945951AbbEVWfS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 May 2015 18:35:18 -0400
In-Reply-To: <555F46DD.5000005@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, jogo@openwrt.org, Florian Fainelli <f.fainelli@gmail.com>, cernekee@gmail.com

On Fri, May 22, 2015 at 8:10 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Alvaro,
>
> Thanks for the update.
>
> On 05/21/2015 07:11 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>>
>> This adds support for the LED controller on Broadcom's BCM6358.
>>
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>>   v2: introduce changes suggested by Jacek
>>   - Use correct device_node when getting brcm,clk-div property.
>>   - Code style fixes suggested by "checkpatch --strict".
>>
>>   drivers/leds/Kconfig        |   8 ++
>>   drivers/leds/Makefile       |   1 +
>>   drivers/leds/leds-bcm6358.c | 243
>> ++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 252 insertions(+)
>>   create mode 100644 drivers/leds/leds-bcm6358.c
>
>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>
>
Applied, thanks,
-Bryan
