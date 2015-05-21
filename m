From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 01/20] leds: implement LED_BRIGHTNESS_FAST flag
Date: Thu, 21 May 2015 15:37:24 +0200
Message-ID: <555DDF94.5040006@samsung.com>
References: <555CA58A.10700@list.ru> <555CA5FA.2080308@list.ru>
 <555DDC01.9050502@samsung.com> <555DDD4B.2090400@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <555DDD4B.2090400@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-leds@vger.kernel.org

On 05/21/2015 03:27 PM, Stas Sergeev wrote:
> 21.05.2015 16:22, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi Stas,
>>
>> My intention was to add a developer of each driver on
>> cc in the commit message.
> I did. You can see CC: Chris Boot <bootc@bootc.net> at patch 12.
> Otherwise, this is all the get_maintainers.pl script gives me.
> So unless you can suggest some other script, or get_maintainers.pl
> is fixed, what do you expect me to do?

You don't have to rely on get_maintainers.pl script only, but
you can obtain the authors' names from driver headers or
MODULE_AUTHOR entries at the bottom.

> Anyway. I can reduce the patchset to just the initial patch and
> the leds-gpio one. In a hope others will change more drivers later.
> At least that would be trivial to review and apply.
> Deal?

Please don't reduce it. The greater number of people familiar with
related drivers/devices will get this, the greater chance that we
won't miss something crucial.

--=20
Best Regards,
Jacek Anaszewski
