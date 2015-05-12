From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v9 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Tue, 12 May 2015 10:42:45 -0700
Message-ID: <CAK5ve-Kc3TDR4EEWSPNnqjJaLTnCbOeLEK-2PsQNqo0zrQ5_rw@mail.gmail.com>
References: <1431419877-28339-1-git-send-email-ingi2.kim@samsung.com>
 <1431419877-28339-3-git-send-email-ingi2.kim@samsung.com> <5551F470.3060304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:33903 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933230AbbELRnG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 13:43:06 -0400
In-Reply-To: <5551F470.3060304@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ingi Kim <ingi2.kim@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sakari Ailus <sakari.ailus@iki.fi>, varkabhadram@gmail.com, Joe Perches <joe@perches.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, jh80.chung@samsung.com, ideal.song@samsung.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Tue, May 12, 2015 at 5:39 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Ingi,
>
> On 05/12/2015 10:37 AM, Ingi Kim wrote:
>>
>> This patch adds the device tree bindings for ktd2692 flash LEDs.
>> Add Optional properties of child node for Flash LED
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
>> Reviewed-by: Varka Bhadram <varkabhadram@gmail.com>
>> ---
>>   .../devicetree/bindings/leds/leds-ktd2692.txt      | 50
>> ++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>
>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>

Merged, thanks.
-Bryan

> --
> Best Regards,
> Jacek Anaszewski
