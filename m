From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH 01/20] leds: implement LED_BRIGHTNESS_FAST flag
Date: Thu, 21 May 2015 16:27:39 +0300
Message-ID: <555DDD4B.2090400@list.ru>
References: <555CA58A.10700@list.ru> <555CA5FA.2080308@list.ru> <555DDC01.9050502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp39.i.mail.ru ([94.100.177.99]:40872 "EHLO smtp39.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755921AbbEUN1r (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 09:27:47 -0400
In-Reply-To: <555DDC01.9050502@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>

21.05.2015 16:22, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Stas,
>=20
> My intention was to add a developer of each driver on
> cc in the commit message.
I did. You can see CC: Chris Boot <bootc@bootc.net> at patch 12.
Otherwise, this is all the get_maintainers.pl script gives me.
So unless you can suggest some other script, or get_maintainers.pl
is fixed, what do you expect me to do?

Anyway. I can reduce the patchset to just the initial patch and
the leds-gpio one. In a hope others will change more drivers later.
At least that would be trivial to review and apply.
Deal?
