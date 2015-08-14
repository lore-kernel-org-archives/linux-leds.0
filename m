From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Synchronized led trigger
Date: Fri, 14 Aug 2015 10:40:53 +0200
Message-ID: <55CDA995.6010709@samsung.com>
References: <715D9F6A60DF2F458F39683D45F6609A7E22E57B@VMPREVAS1.prevas.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9461 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753500AbbHNIk6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 14 Aug 2015 04:40:58 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NT200IGXDG6YI50@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 14 Aug 2015 09:40:54 +0100 (BST)
In-reply-to: <715D9F6A60DF2F458F39683D45F6609A7E22E57B@VMPREVAS1.prevas.se>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Sean_Nyekj=E6r?= <Sean.Nyekjaer@prevas.dk>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Sean,

On 08/13/2015 09:37 AM, Sean Nyekj=E6r wrote:
> Hi
>
> I couldn't find any synchronized led triggers in the kernel. The time=
r trigger was blinking in random when I tried to set our 5 leds. :-)

It is impossible to synchronize brightness setting operation for
different devices. It would only make sense for two separate
LED class devices exposed by a driver controlling one hardware
device. Effectively the issue boils down to the problem of
adding an API for synchronizing brightness setting operation
for several LED class devices exposed by a single LED class
driver. We were trying to implement similar functionality
for synchronizing flash strobe for LED flash class devices,
but it has been given up. You could try to pursue the subject
if you want, here are references: [1], [2].

> So i created this led trigger, which can blink with a half and one hz=
=2E
>
> Is there any place for something like this upstream? I'm prepared to =
make changes so it can be configured by the dtb or some other way.
>
> Cheers
> Sean Nyekj=E6r
>

[1] https://lwn.net/Articles/634465/
[2] http://www.spinics.net/lists/linux-leds/msg02995.html

--=20
Best Regards,
Jacek Anaszewski
