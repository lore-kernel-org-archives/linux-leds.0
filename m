From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH 01/20] leds: implement LED_BRIGHTNESS_FAST flag
Date: Fri, 29 May 2015 19:24:09 +0300
Message-ID: <556892A9.7010406@list.ru>
References: <555CA58A.10700@list.ru> <555CA5FA.2080308@list.ru> <555DDC01.9050502@samsung.com> <555DDD4B.2090400@list.ru> <555DDF94.5040006@samsung.com> <555DF912.4030207@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp39.i.mail.ru ([94.100.177.99]:60462 "EHLO smtp39.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751885AbbE2QYX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 29 May 2015 12:24:23 -0400
In-Reply-To: <555DF912.4030207@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>

21.05.2015 18:26, Stas Sergeev =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> 21.05.2015 16:37, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 05/21/2015 03:27 PM, Stas Sergeev wrote:
>>> 21.05.2015 16:22, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Hi Stas,
>>>>
>>>> My intention was to add a developer of each driver on
>>>> cc in the commit message.
>>> I did. You can see CC: Chris Boot <bootc@bootc.net> at patch 12.
>>> Otherwise, this is all the get_maintainers.pl script gives me.
>>> So unless you can suggest some other script, or get_maintainers.pl
>>> is fixed, what do you expect me to do?
>>
>> You don't have to rely on get_maintainers.pl script only, but
>> you can obtain the authors' names from driver headers or
>> MODULE_AUTHOR entries at the bottom.
>=20
> Re-sent with more CCs.
So what's the status of this?
Looks like it got some ACKs and Reviews.
Jacek, do you give your ACK?
