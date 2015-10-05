From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH 0/2] Add RT5033 Flash LED driver
Date: Mon, 05 Oct 2015 11:11:49 +0900
Message-ID: <5611DC65.3060301@samsung.com>
References: <1443778875-18261-1-git-send-email-ingi2.kim@samsung.com>
 <560E9BC0.20804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56090 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848AbbJECMw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 4 Oct 2015 22:12:52 -0400
In-reply-to: <560E9BC0.20804@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rpurdie@rpsys.net, sameo@linux.intel.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi, Jacek

Thanks for review my patch
Oops! old version patch is sent.
I should have checked..
I'll send new patch, soon.

Thanks
Ingi Kim

On 2015=EB=85=84 10=EC=9B=94 02=EC=9D=BC 23:59, Jacek Anaszewski wrote:
> Hi Ingi,
>=20
> Thanks for the patches. Please fix build errors
> and resubmit.
>=20
> On 10/02/2015 11:41 AM, Ingi Kim wrote:
>> This patch adds ktd2692 Flash LED driver with LED Flash class
>>
>> Ingi Kim (2):
>>    leds: rt5033: add DT binding for RT5033
>>    leds: rt5033: Add RT5033 Flash led device driver
>>
>>   .../devicetree/bindings/leds/leds-rt5033.txt       |  38 ++++
>>   drivers/leds/Kconfig                               |   8 +
>>   drivers/leds/Makefile                              |   1 +
>>   drivers/leds/leds-rt5033.c                         | 222 +++++++++=
++++++++++++
>>   drivers/mfd/rt5033.c                               |   3 +
>>   include/linux/mfd/rt5033-private.h                 |  67 ++++++-
>>   include/linux/mfd/rt5033.h                         |  27 ++-
>>   7 files changed, 355 insertions(+), 11 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5=
033.txt
>>   create mode 100644 drivers/leds/leds-rt5033.c
>>
>=20
>=20
